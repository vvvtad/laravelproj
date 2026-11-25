<?php

use App\Models\MembershipCategory;
use App\Models\MembershipLevel;
use App\Models\User;
use Illuminate\Foundation\Testing\RefreshDatabase;

uses(RefreshDatabase::class);

test('dashboard renders active membership pricing', function () {
    $this->actingAs(User::factory()->create());

    $activeCategory = MembershipCategory::create([
        'name' => 'Standard',
        'slug' => 'standard',
        'description' => null,
        'is_active' => true,
    ]);
    $inactiveCategory = MembershipCategory::create([
        'name' => 'Legacy',
        'slug' => 'legacy',
        'description' => null,
        'is_active' => false,
    ]);

    MembershipLevel::create([
        'membership_category_id' => $activeCategory->id,
        'name' => 'Gold',
        'fee' => '149.50',
        'validity_days' => 365,
        'benefits' => 'Priority support',
        'is_active' => true,
    ]);
    MembershipLevel::create([
        'membership_category_id' => $activeCategory->id,
        'name' => 'Basic',
        'fee' => '49.50',
        'validity_days' => 30,
        'benefits' => null,
        'is_active' => false,
    ]);
    MembershipLevel::create([
        'membership_category_id' => $inactiveCategory->id,
        'name' => 'Platinum',
        'fee' => '299.00',
        'validity_days' => 365,
        'benefits' => 'Legacy benefits',
        'is_active' => true,
    ]);

    $this->get('/')
        ->assertOk()
        ->assertSee('Membership Pricing')
        ->assertSee('Standard')
        ->assertSee('Gold')
        ->assertSee('$149.50')
        ->assertSee('365 days')
        ->assertSee('Priority support')
        ->assertDontSee('Basic')
        ->assertDontSee('Legacy')
        ->assertDontSee('$299.00');
});
