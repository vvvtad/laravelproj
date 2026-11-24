<?php

use App\Models\Member;
use App\Models\MembershipCategory;
use App\Models\MembershipLevel;
use App\Models\MembershipTransaction;
use App\Models\Payment;
use Illuminate\Foundation\Testing\RefreshDatabase;

uses(RefreshDatabase::class);

test('membership models resolve their related records', function () {
    $category = MembershipCategory::create([
        'name' => 'Standard',
        'slug' => 'standard',
        'description' => null,
        'is_active' => true,
    ]);

    $level = MembershipLevel::create([
        'membership_category_id' => $category->id,
        'name' => 'Annual',
        'fee' => '100.00',
        'validity_days' => 365,
        'benefits' => null,
        'is_active' => true,
    ]);

    $member = Member::create([
        'membership_number' => 'MEM-202611-ABC123',
        'first_name' => 'Avery',
        'last_name' => 'Member',
        'email' => 'avery@example.test',
        'phone' => null,
        'address' => null,
        'membership_category_id' => $category->id,
        'membership_level_id' => $level->id,
        'starts_at' => '2026-11-24',
        'expires_at' => '2027-11-24',
        'status' => 'active',
    ]);

    $transaction = MembershipTransaction::create([
        'member_id' => $member->id,
        'transaction_code' => 'TXN-001',
        'type' => 'membership',
        'amount' => '100.00',
        'status' => 'pending',
    ]);

    $payment = Payment::create([
        'member_id' => $member->id,
        'membership_transaction_id' => $transaction->id,
        'amount' => '100.00',
        'payment_method' => 'cash',
        'reference_number' => null,
        'status' => 'pending',
    ]);

    expect($member->category->getKey())->toBe($category->getKey());
    expect($member->level->getKey())->toBe($level->getKey());
    expect($category->members->modelKeys())->toBe([$member->getKey()]);
    expect($level->members->modelKeys())->toBe([$member->getKey()]);
    expect($member->transactions->modelKeys())->toBe([$transaction->getKey()]);
    expect($member->payments->modelKeys())->toBe([$payment->getKey()]);
    expect($transaction->member->getKey())->toBe($member->getKey());
    expect($transaction->payments->modelKeys())->toBe([$payment->getKey()]);
    expect($payment->member->getKey())->toBe($member->getKey());
    expect($payment->transaction->getKey())->toBe($transaction->getKey());
});
