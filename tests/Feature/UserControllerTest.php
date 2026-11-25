<?php

use App\Models\Member;
use App\Models\MembershipCategory;
use App\Models\MembershipLevel;
use App\Models\User;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Support\Facades\Hash;

uses(RefreshDatabase::class);

function makeUserManagementMember(): Member
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
        'first_name' => 'Avery',
        'last_name' => 'Member',
        'email' => 'avery@example.test',
        'membership_category_id' => $category->id,
        'membership_level_id' => $level->id,
        'status' => 'active',
    ]);
}

test('administrators can create a member account explicitly linked to a member record', function () {
    $admin = User::factory()->admin()->create();
    $member = makeUserManagementMember();

    $this->actingAs($admin)
        ->post(route('accounts.store'), [
            'name' => 'Avery Member',
            'email' => 'avery.account@example.test',
            'password' => 'initial-password',
            'password_confirmation' => 'initial-password',
            'role' => User::ROLE_MEMBER,
            'member_id' => $member->id,
        ])
        ->assertRedirect(route('accounts.index'))
        ->assertSessionHas('success');

    $account = User::where('email', 'avery.account@example.test')->firstOrFail();

    $this->assertDatabaseHas('users', [
        'id' => $account->id,
        'role' => User::ROLE_MEMBER,
        'member_id' => $member->id,
    ]);
    expect(Hash::check('initial-password', $account->password))->toBeTrue();
});

test('a member record cannot be linked to more than one account', function () {
    $admin = User::factory()->admin()->create();
    $member = makeUserManagementMember();
    User::factory()->create([
        'role' => User::ROLE_MEMBER,
        'member_id' => $member->id,
    ]);

    $this->actingAs($admin)
        ->post(route('accounts.store'), [
            'name' => 'Duplicate Account',
            'email' => 'duplicate@example.test',
            'password' => 'initial-password',
            'password_confirmation' => 'initial-password',
            'role' => User::ROLE_MEMBER,
            'member_id' => $member->id,
        ])
        ->assertSessionHasErrors('member_id');

    $this->assertDatabaseMissing('users', [
        'email' => 'duplicate@example.test',
    ]);
});

test('pending application accounts cannot be changed through account management', function () {
    $admin = User::factory()->admin()->create();
    $member = makeUserManagementMember();
    $pendingUser = User::factory()->create([
        'role' => User::ROLE_MEMBER,
        'member_id' => null,
        'is_active' => false,
    ]);

    $this->actingAs($admin)
        ->put(route('accounts.update', $pendingUser), [
            'role' => User::ROLE_MEMBER,
            'member_id' => $member->id,
        ])
        ->assertSessionHasErrors('account');

    expect($pendingUser->fresh()->member_id)->toBeNull()
        ->and($pendingUser->fresh()->is_active)->toBeFalse();
});

test('administrator accounts remain unlinked to member records', function () {
    $admin = User::factory()->admin()->create();
    $member = makeUserManagementMember();

    $this->actingAs($admin)
        ->post(route('accounts.store'), [
            'name' => 'Another Admin',
            'email' => 'another-admin@example.test',
            'password' => 'initial-password',
            'password_confirmation' => 'initial-password',
            'role' => User::ROLE_ADMIN,
            'member_id' => $member->id,
        ])
        ->assertRedirect(route('accounts.index'))
        ->assertSessionHas('success');

    $this->assertDatabaseHas('users', [
        'email' => 'another-admin@example.test',
        'role' => User::ROLE_ADMIN,
        'member_id' => null,
    ]);
});

test('administrators cannot remove their own administrator access', function () {
    $admin = User::factory()->admin()->create();
    $member = makeUserManagementMember();

    $this->actingAs($admin)
        ->put(route('accounts.update', $admin), [
            'role' => User::ROLE_MEMBER,
            'member_id' => $member->id,
        ])
        ->assertSessionHasErrors('role');

    expect($admin->fresh()->role)->toBe(User::ROLE_ADMIN);
});

test('the bootstrap command creates an administrator with prompted credentials', function () {
    $this->artisan('app:create-admin-user')
        ->expectsQuestion('Administrator name', 'First Administrator')
        ->expectsQuestion('Administrator email', 'first-admin@example.test')
        ->expectsQuestion('Administrator password', 'SecureAdmin1234')
        ->expectsQuestion('Confirm administrator password', 'SecureAdmin1234')
        ->expectsOutput('Administrator account created.')
        ->assertExitCode(0);

    $admin = User::where('email', 'first-admin@example.test')->firstOrFail();

    expect($admin->role)->toBe(User::ROLE_ADMIN)
        ->and(Hash::check('SecureAdmin1234', $admin->password))->toBeTrue();
});
