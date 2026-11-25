<?php

namespace App\Http\Controllers;

use App\Models\Member;
use App\Models\User;
use Illuminate\Contracts\View\View;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Illuminate\Validation\Rule;
use Illuminate\Validation\Rules\Password;

class UserController extends Controller
{
    public function index(): View
    {
        return view('accounts.index', [
            'accounts' => User::with('member')->orderBy('name')->get(),
            'members' => Member::with('user')
                ->orderBy('last_name')
                ->orderBy('first_name')
                ->get(),
        ]);
    }

    public function store(Request $request): RedirectResponse
    {
        $validated = $request->validate([
            'name' => ['required', 'string', 'max:255'],
            'email' => ['required', 'email', 'max:255', 'unique:users,email'],
            'password' => ['required', 'confirmed', Password::min(8)],
            'role' => ['required', Rule::in([User::ROLE_ADMIN, User::ROLE_MEMBER])],
            'member_id' => [
                'exclude_if:role,'.User::ROLE_ADMIN,
                Rule::requiredIf($request->input('role') === User::ROLE_MEMBER),
                'integer',
                'exists:members,id',
                Rule::unique('users', 'member_id'),
            ],
        ]);

        if ($validated['role'] === User::ROLE_ADMIN) {
            $validated['member_id'] = null;
        }

        User::create($validated);

        return redirect()->route('accounts.index')->with('success', 'Account created successfully.');
    }

    public function update(Request $request, User $user): RedirectResponse
    {
        $validated = $request->validate([
            'role' => ['required', Rule::in([User::ROLE_ADMIN, User::ROLE_MEMBER])],
            'member_id' => [
                'exclude_if:role,'.User::ROLE_ADMIN,
                Rule::requiredIf($request->input('role') === User::ROLE_MEMBER),
                'integer',
                'exists:members,id',
                Rule::unique('users', 'member_id')->ignore($user->id),
            ],
        ]);

        if (! $user->is_active) {
            return back()->withErrors([
                'account' => 'Pending application accounts must be managed from Membership Applications.',
            ]);
        }

        if ($user->is($request->user()) && $validated['role'] !== User::ROLE_ADMIN) {
            return back()->withErrors([
                'role' => 'You cannot remove your own administrator access.',
            ])->withInput();
        }

        if ($validated['role'] === User::ROLE_ADMIN) {
            $validated['member_id'] = null;
        }

        $user->update($validated);

        return redirect()->route('accounts.index')->with('success', 'Account access updated successfully.');
    }
}
