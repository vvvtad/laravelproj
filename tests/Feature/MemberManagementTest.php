<?php

use App\Models\MembershipCategory;
use App\Models\MembershipLevel;
use Database\Seeders\MembershipCatalogSeeder;

it('loads the member form and allows an administrator to create and search members by category and level', function () {
    $category = MembershipCategory::create([
        'name' => 'Student',
        'slug' => 'student',
        'description' => 'Student membership',
        'is_active' => true,
    ]);

    $level = MembershipLevel::create([
        'membership_category_id' => $category->id,
        'name' => 'Gold',
        'fee' => 250.00,
        'validity_days' => 365,
        'benefits' => 'Priority access and discounts',
        'is_active' => true,
    ]);

    $this->get('/members/create')->assertOk();

    $response = $this->post('/members', [
        'first_name' => 'Alice',
        'last_name' => 'Johnson',
        'email' => 'alice@example.com',
        'phone' => '09123456789',
        'address' => 'Cebu City',
        'membership_category_id' => $category->id,
        'membership_level_id' => $level->id,
        'status' => 'active',
    ]);

    $response->assertRedirect('/members');
    $this->assertDatabaseHas('members', [
        'email' => 'alice@example.com',
        'status' => 'active',
    ]);

    $this->get('/members?search=Alice')->assertOk()->assertSee('Alice');
    $this->get('/members?category=Student')->assertOk()->assertSee('Alice');
    $this->get('/members?level=Gold')->assertOk()->assertSee('Alice');
});

it('seeds the default membership categories and levels when the database is empty', function () {
    $this->seed(MembershipCatalogSeeder::class);

    expect(MembershipCategory::query()->where('name', 'Student')->exists())->toBeTrue()
        ->and(MembershipLevel::query()->where('name', 'Gold')->exists())->toBeTrue();

    $this->get('/members/create')
        ->assertOk()
        ->assertSee('Student')
        ->assertSee('Gold');
});

it('shows the category and level dropdowns on the member update form', function () {
    $category = MembershipCategory::create([
        'name' => 'Student',
        'slug' => 'student',
        'description' => 'Student membership',
        'is_active' => true,
    ]);

    $level = MembershipLevel::create([
        'membership_category_id' => $category->id,
        'name' => 'Gold',
        'fee' => 250.00,
        'validity_days' => 365,
        'benefits' => 'Priority access',
        'is_active' => true,
    ]);

    $member = \App\Models\Member::create([
        'membership_number' => 'MEM-202610-TEST01',
        'first_name' => 'Jane',
        'last_name' => 'Doe',
        'email' => 'jane@example.com',
        'phone' => '09123456789',
        'address' => 'Cebu',
        'membership_category_id' => $category->id,
        'membership_level_id' => $level->id,
        'starts_at' => now()->toDateString(),
        'expires_at' => now()->addDays(365)->toDateString(),
        'status' => 'active',
        'notes' => 'Initial record',
    ]);

    $this->get('/members/'.$member->id)
        ->assertOk()
        ->assertSee('Student')
        ->assertSee('Gold');
});

it('shows membership levels on the add member form without requiring a category selection first', function () {
    $this->seed(MembershipCatalogSeeder::class);

    $this->get('/members/create')
        ->assertOk()
        ->assertSee('Basic')
        ->assertSee('Gold')
        ->assertSee('Platinum');
});

it('allows an administrator to delete a member account from the list', function () {
    $category = MembershipCategory::create([
        'name' => 'Student',
        'slug' => 'student',
        'description' => 'Student membership',
        'is_active' => true,
    ]);

    $level = MembershipLevel::create([
        'membership_category_id' => $category->id,
        'name' => 'Gold',
        'fee' => 150.00,
        'validity_days' => 365,
        'benefits' => 'Priority access',
        'is_active' => true,
    ]);

    $member = \App\Models\Member::create([
        'membership_number' => 'MEM-202610-DEL001',
        'first_name' => 'Delete',
        'last_name' => 'Me',
        'email' => 'delete@example.com',
        'phone' => '09111111111',
        'address' => 'Cebu',
        'membership_category_id' => $category->id,
        'membership_level_id' => $level->id,
        'starts_at' => now()->toDateString(),
        'expires_at' => now()->addDays(365)->toDateString(),
        'status' => 'active',
    ]);

    $this->delete(route('members.delete', $member))
        ->assertRedirect('/members');

    $this->assertDatabaseMissing('members', ['id' => $member->id]);
});
