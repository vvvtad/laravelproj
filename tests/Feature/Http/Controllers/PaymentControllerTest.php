<?php

use App\Models\Member;
use App\Models\MembershipCategory;
use App\Models\MembershipLevel;
use App\Models\MembershipTransaction;
use App\Models\User;
use Illuminate\Foundation\Testing\RefreshDatabase;

uses(RefreshDatabase::class);

test('payments page explains when no transactions or payments are available', function () {
    $this->actingAs(User::factory()->admin()->create());

    $this->get(route('payments.index'))
        ->assertOk()
        ->assertSee('No transactions available')
        ->assertSee('No transactions are available to pay.')
        ->assertSee(route('transactions.index'))
        ->assertSee('No payments have been recorded.');
});

test('payments page lists approved transactions but excludes cancelled transactions', function () {
    $this->actingAs(User::factory()->admin()->create());

    $category = MembershipCategory::create([
        'name' => 'Standard',
        'slug' => 'standard',
        'is_active' => true,
    ]);

    $level = MembershipLevel::create([
        'membership_category_id' => $category->id,
        'name' => 'Basic',
        'fee' => '100.00',
        'validity_days' => 365,
        'is_active' => true,
    ]);

    $member = Member::create([
        'first_name' => 'Avery',
        'last_name' => 'Member',
        'email' => 'avery@example.test',
        'membership_category_id' => $category->id,
        'membership_level_id' => $level->id,
    ]);

    MembershipTransaction::create([
        'member_id' => $member->id,
        'transaction_code' => 'TXN-APPROVED',
        'type' => 'application',
        'amount' => '100.00',
        'status' => 'approved',
    ]);
    MembershipTransaction::create([
        'member_id' => $member->id,
        'transaction_code' => 'TXN-CANCELLED',
        'type' => 'application',
        'amount' => '100.00',
        'status' => 'cancelled',
    ]);

    $this->get(route('payments.index'))
        ->assertOk()
        ->assertSee('TXN-APPROVED')
        ->assertDontSee('TXN-CANCELLED');
});
