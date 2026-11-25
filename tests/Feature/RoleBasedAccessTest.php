<?php

use App\Models\Member;
use App\Models\MembershipCategory;
use App\Models\MembershipLevel;
use App\Models\MembershipTransaction;
use App\Models\Task;
use App\Models\User;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Support\Facades\Hash;

uses(RefreshDatabase::class);

function makeAccessTestMember(string $email): Member
{
    $category = MembershipCategory::factory()->create();
    $level = MembershipLevel::create([
        'membership_category_id' => $category->id,
        'name' => 'Standard',
        'fee' => '100.00',
        'validity_days' => 365,
        'is_active' => true,
    ]);

    return Member::create([
        'first_name' => 'Member',
        'last_name' => 'Account',
        'email' => $email,
        'membership_category_id' => $category->id,
        'membership_level_id' => $level->id,
        'status' => 'active',
    ]);
}

test('members see only their permitted navigation and account details', function () {
    $member = makeAccessTestMember('member@example.test');
    $user = User::factory()->create([
        'name' => 'Member User',
        'email' => 'member@example.test',
        'role' => User::ROLE_MEMBER,
        'member_id' => $member->id,
    ]);

    $this->actingAs($user)
        ->get(route('dashboard'))
        ->assertOk()
        ->assertSee($member->membership_number)
        ->assertSee('Dashboard')
        ->assertSee('Tasks')
        ->assertSee('Transactions')
        ->assertSee('Account')
        ->assertDontSee(route('payments.index'))
        ->assertDontSee(route('members.index'))
        ->assertDontSee(route('accounts.index'))
        ->assertDontSee('Collected payments');

    $this->get(route('account.show'))
        ->assertOk()
        ->assertSee('Member User')
        ->assertSee('member@example.test')
        ->assertSee($member->membership_number);
});

test('member transaction history contains only transactions for their linked member', function () {
    $member = makeAccessTestMember('member@example.test');
    $otherMember = makeAccessTestMember('other@example.test');
    $user = User::factory()->create([
        'role' => User::ROLE_MEMBER,
        'member_id' => $member->id,
    ]);

    MembershipTransaction::create([
        'member_id' => $member->id,
        'transaction_code' => 'TXN-MEMBER-ONLY',
        'type' => 'application',
        'amount' => '100.00',
        'status' => 'pending',
    ]);
    MembershipTransaction::create([
        'member_id' => $otherMember->id,
        'transaction_code' => 'TXN-OTHER-MEMBER',
        'type' => 'application',
        'amount' => '200.00',
        'status' => 'paid',
    ]);

    $this->actingAs($user)
        ->get(route('transactions.index'))
        ->assertOk()
        ->assertSee('TXN-MEMBER-ONLY')
        ->assertDontSee('TXN-OTHER-MEMBER')
        ->assertDontSee('Create transaction');
});

test('members can view tasks but cannot change them', function () {
    $user = User::factory()->create(['role' => User::ROLE_MEMBER]);
    $task = Task::create([
        'task_title' => 'Shared task',
        'description' => 'Task details',
    ]);

    $this->actingAs($user)
        ->get(route('tasks.index'))
        ->assertOk()
        ->assertSee('Shared task')
        ->assertDontSee('Add Task')
        ->assertDontSee(route('tasks.edit', $task->id));

    $this->post(route('tasks.store'), [
        'task_title' => 'Unauthorized task',
        'description' => null,
    ])->assertForbidden();

    $this->assertDatabaseMissing('tasks', [
        'task_title' => 'Unauthorized task',
    ]);
});

test('members cannot access administrator sections', function () {
    $user = User::factory()->create(['role' => User::ROLE_MEMBER]);

    $this->actingAs($user)
        ->get(route('members.index'))
        ->assertForbidden();

    $this->get(route('payments.index'))
        ->assertForbidden();

    $this->get(route('accounts.index'))
        ->assertForbidden();

    $this->get(route('membership-applications.index'))
        ->assertForbidden();
});

test('unlinked members see no transaction history and are prompted to contact an administrator', function () {
    $user = User::factory()->create([
        'role' => User::ROLE_MEMBER,
        'member_id' => null,
    ]);

    $this->actingAs($user)
        ->get(route('transactions.index'))
        ->assertOk()
        ->assertSee('No transaction history');

    $this->get(route('account.show'))
        ->assertOk()
        ->assertSee('not linked to a membership record');
});

test('members can change their password from their own account page', function () {
    $user = User::factory()->create(['role' => User::ROLE_MEMBER]);

    $this->actingAs($user)
        ->put(route('account.password.update'), [
            'current_password' => 'password',
            'password' => 'new-member-password',
            'password_confirmation' => 'new-member-password',
        ])
        ->assertRedirect(route('account.show'))
        ->assertSessionHas('success');

    expect(Hash::check('new-member-password', $user->fresh()->password))->toBeTrue();
});

test('members cannot change their password without the current password', function () {
    $user = User::factory()->create(['role' => User::ROLE_MEMBER]);

    $this->actingAs($user)
        ->put(route('account.password.update'), [
            'current_password' => 'incorrect-password',
            'password' => 'new-member-password',
            'password_confirmation' => 'new-member-password',
        ])
        ->assertSessionHasErrors('current_password');

    expect(Hash::check('password', $user->fresh()->password))->toBeTrue();
});

test('administrators retain access to management pages and links', function () {
    $user = User::factory()->admin()->create();

    $this->actingAs($user)
        ->get(route('dashboard'))
        ->assertOk()
        ->assertSee('Total members')
        ->assertSee('Payments')
        ->assertSee('Members')
        ->assertSee('Accounts')
        ->assertSee(route('membership.create'));

    $this->get(route('members.index'))->assertOk();
    $this->get(route('payments.index'))->assertOk();
    $this->get(route('accounts.index'))->assertOk();
    $this->get(route('membership-applications.index'))
        ->assertOk()
        ->assertSee('Membership Applications');
});
