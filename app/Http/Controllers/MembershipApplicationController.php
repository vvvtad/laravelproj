<?php

namespace App\Http\Controllers;

use App\Http\Requests\StoreMembershipApplicationRequest;
use App\Models\Member;
use App\Models\MembershipApplication;
use App\Models\MembershipCategory;
use App\Models\MembershipLevel;
use App\Models\MembershipTransaction;
use App\Models\User;
use App\Notifications\MembershipApplicationReviewed;
use App\Notifications\MembershipApplicationSubmitted;
use Illuminate\Contracts\View\View;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Arr;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Notification;
use Illuminate\Validation\Rule;
use Illuminate\Validation\ValidationException;

class MembershipApplicationController extends Controller
{
    public function index(): View
    {
        return view('membership.applications.index', [
            'applications' => MembershipApplication::with(['category.levels', 'user.member'])
                ->latest()
                ->get(),
        ]);
    }

    public function create(): View
    {
        return view('membership.create', [
            'categories' => MembershipCategory::where('is_active', true)
                ->orderBy('name')
                ->get(),
        ]);
    }

    public function store(StoreMembershipApplicationRequest $request): RedirectResponse
    {
        $validated = $request->validated();

        $application = DB::transaction(function () use ($validated): MembershipApplication {
            $application = MembershipApplication::create([
                ...Arr::except($validated, ['password']),
                'reference_no' => MembershipApplication::generateReferenceNumber(),
            ]);

            $user = User::create([
                'name' => $application->full_name,
                'email' => $application->email,
                'password' => $validated['password'],
                'role' => User::ROLE_MEMBER,
                'is_active' => false,
            ]);

            $application->user()->associate($user);
            $application->save();

            Notification::route('mail', $application->email)
                ->notify(new MembershipApplicationSubmitted($application));

            $application->update(['verification_sent_at' => now()]);

            return $application;
        });

        return redirect()->route('membership.create')->with(
            'success',
            "Application saved. Your account is pending administrator approval. Confirmation email queued. Reference: {$application->reference_no}"
        );
    }

    public function approve(Request $request, MembershipApplication $application): RedirectResponse
    {
        $validated = $request->validate([
            'membership_level_id' => [
                'required',
                'integer',
                Rule::exists('membership_levels', 'id')
                    ->where('membership_category_id', $application->membership_category_id)
                    ->where('is_active', true),
            ],
        ]);

        $member = DB::transaction(function () use ($application, $validated): Member {
            $application = MembershipApplication::query()
                ->lockForUpdate()
                ->findOrFail($application->id);

            if ($application->status !== MembershipApplication::STATUS_PENDING) {
                throw ValidationException::withMessages([
                    'application' => 'Only pending applications can be approved.',
                ]);
            }

            $user = $application->user;

            if ($user === null) {
                throw ValidationException::withMessages([
                    'application' => 'This application has no linked login account and cannot be approved.',
                ]);
            }

            if ($user->is_active || $user->isAdmin() || $user->member_id !== null) {
                throw ValidationException::withMessages([
                    'application' => 'The linked account is not in a pending application state.',
                ]);
            }

            if (Member::where('email', $application->email)->exists()) {
                throw ValidationException::withMessages([
                    'application' => 'A member record already uses this email address.',
                ]);
            }

            $level = MembershipLevel::query()
                ->where('membership_category_id', $application->membership_category_id)
                ->where('is_active', true)
                ->find($validated['membership_level_id']);

            if ($level === null) {
                throw ValidationException::withMessages([
                    'membership_level_id' => 'Choose an active level from the applicant\'s selected category.',
                ]);
            }

            $isFreeMembership = (float) $level->fee === 0.0;
            $nameParts = preg_split('/\s+/', trim($application->full_name), -1, PREG_SPLIT_NO_EMPTY) ?: [];
            $lastName = array_pop($nameParts) ?? '';
            $firstName = implode(' ', $nameParts);

            if ($firstName === '') {
                $firstName = $lastName;
            }

            $member = Member::create([
                'first_name' => $firstName,
                'last_name' => $lastName !== '' ? $lastName : $firstName,
                'email' => $application->email,
                'phone' => $application->phone,
                'address' => $application->address,
                'membership_category_id' => $application->membership_category_id,
                'membership_level_id' => $level->id,
                'status' => $isFreeMembership ? 'active' : 'pending',
                'starts_at' => $isFreeMembership ? now()->toDateString() : null,
                'expires_at' => $isFreeMembership
                    ? now()->addDays($level->validity_days)->toDateString()
                    : null,
            ]);

            if (! $isFreeMembership) {
                MembershipTransaction::create([
                    'member_id' => $member->id,
                    'type' => 'application',
                    'amount' => $level->fee,
                    'status' => 'pending',
                ]);
            }

            $user->update([
                'member_id' => $member->id,
                'is_active' => true,
            ]);

            $application->update([
                'status' => MembershipApplication::STATUS_APPROVED,
                'reviewed_at' => now(),
            ]);

            Notification::route('mail', $application->email)
                ->notify(new MembershipApplicationReviewed(
                    $application,
                    approved: true,
                    paymentRequired: ! $isFreeMembership,
                ));

            return $member;
        });

        $message = $member->status === 'active'
            ? 'Application approved. The member account is active.'
            : 'Application approved. The member account can sign in, and membership is pending payment.';

        return redirect()->route('membership-applications.index')->with('success', $message);
    }

    public function reject(MembershipApplication $application): RedirectResponse
    {
        DB::transaction(function () use ($application): void {
            $application = MembershipApplication::query()
                ->lockForUpdate()
                ->findOrFail($application->id);

            if ($application->status !== MembershipApplication::STATUS_PENDING) {
                throw ValidationException::withMessages([
                    'application' => 'Only pending applications can be rejected.',
                ]);
            }

            $email = $application->email;
            $user = $application->user;

            if ($user !== null && ! $user->is_active) {
                $user->delete();
            }

            $application->update([
                'status' => MembershipApplication::STATUS_REJECTED,
                'reviewed_at' => now(),
            ]);

            Notification::route('mail', $email)
                ->notify(new MembershipApplicationReviewed($application, approved: false));
        });

        return redirect()->route('membership-applications.index')
            ->with('success', 'Application rejected. The applicant may submit a new application if needed.');
    }
}
