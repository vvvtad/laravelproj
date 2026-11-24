<?php

namespace App\Http\Controllers;

use App\Models\Member;
use App\Models\MembershipCategory;
use App\Models\MembershipLevel;
use Illuminate\Contracts\View\View;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Str;
use Illuminate\Validation\Rule;

class MemberController extends Controller
{
    private const MEMBERSHIP_LEVEL_NAMES = ['Basic', 'Silver', 'Gold', 'Platinum'];

    private function ensureDefaultMembershipCatalog(): void
    {
        $fees = [
            'Basic' => 0,
            'Silver' => 600,
            'Gold' => 150,
            'Platinum' => 350,
        ];
        $categories = ['Student', 'Regular', 'Senior Citizen', 'Corporate'];

        foreach ($categories as $categoryName) {
            $category = MembershipCategory::firstOrCreate(
                ['slug' => Str::slug($categoryName)],
                [
                    'name' => $categoryName,
                    'slug' => Str::slug($categoryName),
                    'description' => $categoryName.' membership',
                    'is_active' => true,
                ]
            );

            foreach ($fees as $levelName => $fee) {
                MembershipLevel::firstOrCreate(
                    [
                        'membership_category_id' => $category->id,
                        'name' => $levelName,
                    ],
                    [
                        'membership_category_id' => $category->id,
                        'name' => $levelName,
                        'fee' => $fee,
                        'validity_days' => 365,
                        'benefits' => $levelName.' access and benefits',
                        'is_active' => true,
                    ]
                )->update(['is_active' => true]);
            }
        }

        MembershipLevel::whereNotIn('name', self::MEMBERSHIP_LEVEL_NAMES)
            ->update(['is_active' => false]);
    }

    private function activeCategories()
    {
        $this->ensureDefaultMembershipCatalog();

        return MembershipCategory::where('is_active', true)->get();
    }

    private function activeLevels()
    {
        $this->ensureDefaultMembershipCatalog();

        return MembershipLevel::where('is_active', true)
            ->whereIn('name', self::MEMBERSHIP_LEVEL_NAMES)
            ->with('category')
            ->orderBy('membership_category_id')
            ->get();
    }

    private function searchableLevels()
    {
        return $this->activeLevels()
            ->unique('name')
            ->values();
    }

    private function allowedLevelIds(): array
    {
        return $this->activeLevels()->pluck('id')->all();
    }

    /**
     * @return array<string, mixed>
     */
    private function listViewData(Request $request): array
    {
        $search = trim((string) $request->input('search', ''));
        $categoryFilter = $request->input('category');
        $levelFilter = $request->input('level');

        $members = Member::with(['category', 'level'])
            ->when($search !== '', function ($query) use ($search) {
                $query->where(function ($query) use ($search) {
                    $query->where('first_name', 'like', "%{$search}%")
                        ->orWhere('last_name', 'like', "%{$search}%")
                        ->orWhere('email', 'like', "%{$search}%");
                });
            })
            ->when($categoryFilter, function ($query, $categoryFilter) {
                $query->whereHas('category', function ($subQuery) use ($categoryFilter) {
                    $subQuery->where('name', $categoryFilter)
                        ->orWhere('slug', $categoryFilter);
                });
            })
            ->when($levelFilter, function ($query, $levelFilter) {
                $query->whereHas('level', function ($subQuery) use ($levelFilter) {
                    $subQuery->where('name', $levelFilter);
                });
            })
            ->latest()
            ->get();

        return [
            'members' => $members,
            'categories' => $this->activeCategories(),
            'levels' => $this->activeLevels(),
            'searchLevels' => $this->searchableLevels(),
            'search' => $search,
            'categoryFilter' => $categoryFilter,
            'levelFilter' => $levelFilter,
        ];
    }

    public function index(Request $request): View
    {
        return view('members', $this->listViewData($request));
    }

    public function create(Request $request): View
    {
        return view('members', $this->listViewData($request));
    }

    public function store(Request $request): RedirectResponse
    {
        $validated = $request->validate([
            'first_name' => ['required', 'string', 'max:255'],
            'last_name' => ['required', 'string', 'max:255'],
            'email' => ['required', 'email', 'max:255', 'unique:members,email'],
            'phone' => ['nullable', 'string', 'max:255'],
            'address' => ['nullable', 'string'],
            'membership_category_id' => ['required', 'exists:membership_categories,id'],
            'membership_level_id' => ['required', Rule::in($this->allowedLevelIds())],
            'status' => ['required', 'in:active,inactive,pending,deactivated'],
            'notes' => ['nullable', 'string'],
        ]);

        $category = MembershipCategory::findOrFail($validated['membership_category_id']);
        $level = MembershipLevel::findOrFail($validated['membership_level_id']);

        if ((int) $level->membership_category_id !== (int) $category->id) {
            return back()->withErrors([
                'membership_level_id' => 'The selected membership level does not belong to the selected category.',
            ])->withInput();
        }

        $validated['membership_number'] = Member::generateMembershipNumber();
        $validated['starts_at'] = now()->toDateString();
        $validated['expires_at'] = now()->addDays($level->validity_days ?? 365)->toDateString();

        Member::create($validated);

        return redirect()->route('members.index')->with('success', 'Member added successfully.');
    }

    public function show(Request $request, Member $member): View
    {
        $member->load(['category', 'level.category', 'transactions.payments', 'payments.transaction']);

        return view('members', $this->listViewData($request) + [
            'selectedMember' => $member,
        ]);
    }

    public function edit(Request $request, Member $member): View
    {
        return view('members', $this->listViewData($request) + [
            'editingMember' => $member,
        ]);
    }

    public function update(Request $request, Member $member): RedirectResponse
    {
        $validated = $request->validate([
            'first_name' => ['required', 'string', 'max:255'],
            'last_name' => ['required', 'string', 'max:255'],
            'email' => ['required', 'email', 'max:255', 'unique:members,email,'.$member->id],
            'phone' => ['nullable', 'string', 'max:255'],
            'address' => ['nullable', 'string'],
            'membership_category_id' => ['required', 'exists:membership_categories,id'],
            'membership_level_id' => ['required', Rule::in($this->allowedLevelIds())],
            'status' => ['required', 'in:active,inactive,pending,deactivated'],
            'notes' => ['nullable', 'string'],
        ]);

        $category = MembershipCategory::findOrFail($validated['membership_category_id']);
        $level = MembershipLevel::findOrFail($validated['membership_level_id']);

        if ((int) $level->membership_category_id !== (int) $category->id) {
            return back()->withErrors([
                'membership_level_id' => 'The selected membership level does not belong to the selected category.',
            ])->withInput();
        }

        $validated['starts_at'] = $member->starts_at ?? now()->toDateString();
        $validated['expires_at'] = $member->expires_at ?? now()->addDays($level->validity_days ?? 365)->toDateString();

        $member->update($validated);

        return redirect()->route('members.show', $member)->with('success', 'Member details updated successfully.');
    }

    public function destroy(Member $member): RedirectResponse
    {
        $member->update(['status' => 'deactivated']);

        return redirect()->route('members.index')->with('success', 'Member deactivated successfully.');
    }

    public function delete(Member $member): RedirectResponse
    {
        abort_unless($member->status === 'deactivated', 403, 'Only deactivated members can be permanently deleted.');

        $member->delete();

        return redirect()->route('members.index')->with('success', 'Member account deleted successfully.');
    }

    public function print(Member $member): View
    {
        $member->load(['category', 'level', 'transactions.payments']);

        return view('member-print', ['member' => $member]);
    }
}
