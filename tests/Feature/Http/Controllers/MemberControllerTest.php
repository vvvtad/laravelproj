<?php

use App\Models\Member;
use App\Models\MembershipCategory;
use App\Models\MembershipLevel;
use Illuminate\Foundation\Testing\RefreshDatabase;

uses(RefreshDatabase::class);

test('the member index and member details pages render', function () {
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
        'status' => 'active',
    ]);

    $this->get(route('members.index'))
        ->assertOk()
        ->assertSee('Avery Member')
        ->assertSee('Add a member');

    $this->get(route('members.show', $member))
        ->assertOk()
        ->assertViewIs('members')
        ->assertSee('Member details')
        ->assertSee($member->membership_number);

    $this->get(route('members.edit', $member))
        ->assertOk()
        ->assertSee('Edit member')
        ->assertSee($member->email);

    $this->get(route('members.create'))
        ->assertOk()
        ->assertSee('Add a member');
});

test('the member form persists notes and returns to the list', function () {
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

    $response = $this->post(route('members.store'), [
        'first_name' => 'Avery',
        'last_name' => 'Member',
        'email' => 'avery@example.test',
        'membership_category_id' => $category->id,
        'membership_level_id' => $level->id,
        'status' => 'active',
        'notes' => 'Contact by email',
    ]);

    $response->assertRedirect(route('members.index'));

    $this->assertDatabaseHas('members', [
        'email' => 'avery@example.test',
        'membership_category_id' => $category->id,
        'membership_level_id' => $level->id,
        'notes' => 'Contact by email',
    ]);
});

test('the member form rejects a level from another category', function () {
    $selectedCategory = MembershipCategory::create([
        'name' => 'Student',
        'slug' => 'student',
        'is_active' => true,
    ]);

    $otherCategory = MembershipCategory::create([
        'name' => 'Regular',
        'slug' => 'regular',
        'is_active' => true,
    ]);

    $level = MembershipLevel::create([
        'membership_category_id' => $otherCategory->id,
        'name' => 'Basic',
        'fee' => '100.00',
        'validity_days' => 365,
        'is_active' => true,
    ]);

    $this->post(route('members.store'), [
        'first_name' => 'Avery',
        'last_name' => 'Member',
        'email' => 'avery@example.test',
        'membership_category_id' => $selectedCategory->id,
        'membership_level_id' => $level->id,
        'status' => 'active',
    ])->assertSessionHasErrors('membership_level_id');

    $this->assertDatabaseMissing('members', [
        'email' => 'avery@example.test',
    ]);
});

test('members can be updated and deactivated through resource routes', function () {
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
        'status' => 'active',
    ]);

    $this->put(route('members.update', $member), [
        'first_name' => 'Updated',
        'last_name' => 'Member',
        'email' => 'avery@example.test',
        'membership_category_id' => $category->id,
        'membership_level_id' => $level->id,
        'status' => 'active',
        'notes' => 'Updated note',
    ])->assertRedirect(route('members.show', $member));

    $this->assertDatabaseHas('members', [
        'id' => $member->id,
        'first_name' => 'Updated',
        'notes' => 'Updated note',
    ]);

    $this->delete(route('members.destroy', $member))
        ->assertRedirect(route('members.index'));

    $this->assertDatabaseHas('members', [
        'id' => $member->id,
        'status' => 'deactivated',
    ]);
});

test('only deactivated members have a permanent delete option', function () {
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

    $activeMember = Member::create([
        'first_name' => 'Active',
        'last_name' => 'Member',
        'email' => 'active@example.test',
        'membership_category_id' => $category->id,
        'membership_level_id' => $level->id,
        'status' => 'active',
    ]);

    $deactivatedMember = Member::create([
        'first_name' => 'Deactivated',
        'last_name' => 'Member',
        'email' => 'deactivated@example.test',
        'membership_category_id' => $category->id,
        'membership_level_id' => $level->id,
        'status' => 'deactivated',
    ]);

    $this->get(route('members.index'))
        ->assertOk()
        ->assertSee(route('members.delete', $deactivatedMember))
        ->assertDontSee(route('members.delete', $activeMember));
});

test('active members cannot be permanently deleted', function () {
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
        'status' => 'active',
    ]);

    $this->delete(route('members.delete', $member))->assertForbidden();

    $this->assertModelExists($member);
});

test('deactivated members can be permanently deleted', function () {
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
        'status' => 'deactivated',
    ]);

    $this->delete(route('members.delete', $member))
        ->assertRedirect(route('members.index'));

    $this->assertModelMissing($member);
});
