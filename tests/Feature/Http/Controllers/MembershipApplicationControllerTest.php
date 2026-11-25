<?php

use App\Models\MembershipApplication;
use App\Models\MembershipCategory;
use App\Models\MembershipLevel;
use App\Models\User;
use App\Notifications\MembershipApplicationReviewed;
use App\Notifications\MembershipApplicationSubmitted;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Notifications\AnonymousNotifiable;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Notification;

uses(RefreshDatabase::class);

test('application form lists active categories and uses OpenStreetMap', function () {
    MembershipCategory::factory()->create([
        'name' => 'Regular',
        'slug' => 'regular',
    ]);
    MembershipCategory::factory()->create([
        'name' => 'Inactive',
        'slug' => 'inactive',
        'is_active' => false,
    ]);

    $this->get(route('membership.create'))
        ->assertOk()
        ->assertSee('Regular')
        ->assertDontSee('Inactive')
        ->assertSee('tile.openstreetmap.org')
        ->assertDontSee('maps.googleapis.com')
        ->assertSee('name="password"', false)
        ->assertSee('name="password_confirmation"', false);
});

test('applicant submission stores an application and queues its email notification', function () {
    Notification::fake();

    $category = MembershipCategory::factory()->create();

    $this->post(route('membership.store'), [
        'membership_category_id' => $category->id,
        'full_name' => 'Ana Cruz',
        'email' => 'ana@example.test',
        'phone' => '555-0100',
        'address' => 'Manila',
        'latitude' => '14.5995',
        'longitude' => '120.9842',
        'password' => 'member-password',
        'password_confirmation' => 'member-password',
    ])->assertRedirect(route('membership.create'))
        ->assertSessionHas('success');

    $application = MembershipApplication::where('email', 'ana@example.test')->firstOrFail();
    $user = User::where('email', 'ana@example.test')->firstOrFail();

    $this->assertDatabaseHas('membership_applications', [
        'id' => $application->id,
        'membership_category_id' => $category->id,
        'full_name' => 'Ana Cruz',
        'email' => 'ana@example.test',
        'status' => 'pending',
    ]);
    $this->assertDatabaseHas('users', [
        'id' => $user->id,
        'name' => 'Ana Cruz',
        'email' => 'ana@example.test',
        'role' => User::ROLE_MEMBER,
        'member_id' => null,
        'is_active' => false,
    ]);
    expect($application->reference_no)->toMatch('/^MEM-[A-Z0-9]{10}$/');
    expect($application->verification_sent_at)->not->toBeNull();
    expect($application->category->is($category))->toBeTrue();
    expect(Hash::check('member-password', $user->password))->toBeTrue();
    expect($application->user->is($user))->toBeTrue();

    Notification::assertSentOnDemand(
        MembershipApplicationSubmitted::class,
        fn (MembershipApplicationSubmitted $notification, array $channels, object $notifiable): bool => $channels === ['mail']
            && $notifiable->routes['mail'] === 'ana@example.test'
            && $notification->application->is($application)
    );
});

test('applicant submission rejects inactive categories', function () {
    $category = MembershipCategory::factory()->create([
        'is_active' => false,
    ]);

    $this->post(route('membership.store'), [
        'membership_category_id' => $category->id,
        'full_name' => 'Ana Cruz',
        'email' => 'ana@example.test',
        'latitude' => '14.5995',
        'longitude' => '120.9842',
        'password' => 'member-password',
        'password_confirmation' => 'member-password',
    ])->assertSessionHasErrors('membership_category_id');

    $this->assertDatabaseCount('membership_applications', 0);
});

test('applicant submission rejects coordinates outside the valid ranges', function () {
    $category = MembershipCategory::factory()->create();

    $this->post(route('membership.store'), [
        'membership_category_id' => $category->id,
        'full_name' => 'Ana Cruz',
        'email' => 'ana@example.test',
        'latitude' => '91',
        'longitude' => '181',
        'password' => 'member-password',
        'password_confirmation' => 'member-password',
    ])->assertSessionHasErrors(['latitude', 'longitude']);

    $this->assertDatabaseCount('membership_applications', 0);
});

test('applicant submission rejects passwords that do not match', function () {
    $category = MembershipCategory::factory()->create();

    $this->post(route('membership.store'), [
        'membership_category_id' => $category->id,
        'full_name' => 'Ana Cruz',
        'email' => 'ana@example.test',
        'password' => 'member-password',
        'password_confirmation' => 'different-password',
    ])->assertSessionHasErrors('password');

    $this->assertDatabaseCount('membership_applications', 0);
    $this->assertDatabaseCount('users', 0);
});

test('administrators can approve an application and enable its account while payment is pending', function () {
    Notification::fake();

    $category = MembershipCategory::factory()->create();
    $level = MembershipLevel::create([
        'membership_category_id' => $category->id,
        'name' => 'Standard',
        'fee' => '100.00',
        'validity_days' => 365,
        'is_active' => true,
    ]);

    $this->post(route('membership.store'), [
        'membership_category_id' => $category->id,
        'full_name' => 'Ana Cruz',
        'email' => 'ana@example.test',
        'phone' => '555-0100',
        'address' => 'Manila',
        'password' => 'member-password',
        'password_confirmation' => 'member-password',
    ])->assertRedirect(route('membership.create'));

    $application = MembershipApplication::where('email', 'ana@example.test')->firstOrFail();
    $user = User::where('email', 'ana@example.test')->firstOrFail();

    $this->from(route('login'))
        ->post(route('login.store'), [
            'email' => $user->email,
            'password' => 'member-password',
        ])
        ->assertRedirect(route('login'))
        ->assertSessionHasErrors(['email' => __('auth.failed')]);

    $this->assertGuest();

    $this->actingAs(User::factory()->admin()->create())
        ->post(route('membership-applications.approve', $application), [
            'membership_level_id' => $level->id,
        ])
        ->assertRedirect(route('membership-applications.index'))
        ->assertSessionHas('success');

    $member = $user->fresh()->member;

    $this->assertDatabaseHas('membership_applications', [
        'id' => $application->id,
        'status' => MembershipApplication::STATUS_APPROVED,
    ]);
    $this->assertDatabaseHas('members', [
        'id' => $member->id,
        'first_name' => 'Ana',
        'last_name' => 'Cruz',
        'email' => 'ana@example.test',
        'membership_category_id' => $category->id,
        'membership_level_id' => $level->id,
        'status' => 'pending',
    ]);
    $this->assertDatabaseHas('membership_transactions', [
        'member_id' => $member->id,
        'type' => 'application',
        'amount' => '100.00',
        'status' => 'pending',
    ]);
    expect($user->fresh()->is_active)->toBeTrue();

    Notification::assertSentOnDemand(
        MembershipApplicationReviewed::class,
        fn (MembershipApplicationReviewed $notification, array $channels, object $notifiable): bool => $channels === ['mail']
            && $notifiable->routes['mail'] === 'ana@example.test'
            && $notification->approved
            && $notification->paymentRequired
    );

    $this->post(route('logout'));

    $this->post(route('login.store'), [
        'email' => $user->email,
        'password' => 'member-password',
    ])->assertRedirect(route('dashboard'));

    $this->assertAuthenticatedAs($user->fresh());
});

test('administrators can activate a free membership without creating a payment transaction', function () {
    Notification::fake();

    $category = MembershipCategory::factory()->create();
    $level = MembershipLevel::create([
        'membership_category_id' => $category->id,
        'name' => 'Free',
        'fee' => '0.00',
        'validity_days' => 365,
        'is_active' => true,
    ]);

    $this->post(route('membership.store'), [
        'membership_category_id' => $category->id,
        'full_name' => 'Ana Cruz',
        'email' => 'ana@example.test',
        'password' => 'member-password',
        'password_confirmation' => 'member-password',
    ]);

    $application = MembershipApplication::where('email', 'ana@example.test')->firstOrFail();

    $this->actingAs(User::factory()->admin()->create())
        ->post(route('membership-applications.approve', $application), [
            'membership_level_id' => $level->id,
        ])
        ->assertRedirect(route('membership-applications.index'));

    $user = User::where('email', 'ana@example.test')->firstOrFail();

    $this->assertDatabaseHas('members', [
        'id' => $user->member_id,
        'status' => 'active',
    ]);
    $this->assertDatabaseCount('membership_transactions', 0);
});

test('administrators cannot approve an application with a level from another category', function () {
    Notification::fake();

    $category = MembershipCategory::factory()->create();
    $otherCategory = MembershipCategory::factory()->create();
    $otherLevel = MembershipLevel::create([
        'membership_category_id' => $otherCategory->id,
        'name' => 'Other',
        'fee' => '100.00',
        'validity_days' => 365,
        'is_active' => true,
    ]);
    $this->post(route('membership.store'), [
        'membership_category_id' => $category->id,
        'full_name' => 'Ana Cruz',
        'email' => 'ana@example.test',
        'password' => 'member-password',
        'password_confirmation' => 'member-password',
    ]);

    $application = MembershipApplication::where('email', 'ana@example.test')->firstOrFail();

    $this->actingAs(User::factory()->admin()->create())
        ->post(route('membership-applications.approve', $application), [
            'membership_level_id' => $otherLevel->id,
        ])
        ->assertSessionHasErrors('membership_level_id');

    $this->assertDatabaseHas('membership_applications', [
        'id' => $application->id,
        'status' => MembershipApplication::STATUS_PENDING,
    ]);
    $this->assertDatabaseCount('members', 0);
    $this->assertDatabaseCount('membership_transactions', 0);
});

test('administrators can reject an application without leaving an enabled account', function () {
    Notification::fake();

    $category = MembershipCategory::factory()->create();
    $this->post(route('membership.store'), [
        'membership_category_id' => $category->id,
        'full_name' => 'Ana Cruz',
        'email' => 'ana@example.test',
        'password' => 'member-password',
        'password_confirmation' => 'member-password',
    ]);

    $application = MembershipApplication::where('email', 'ana@example.test')->firstOrFail();
    $user = User::where('email', 'ana@example.test')->firstOrFail();

    $this->actingAs(User::factory()->admin()->create())
        ->post(route('membership-applications.reject', $application))
        ->assertRedirect(route('membership-applications.index'))
        ->assertSessionHas('success');

    $this->assertDatabaseHas('membership_applications', [
        'id' => $application->id,
        'status' => MembershipApplication::STATUS_REJECTED,
        'user_id' => null,
    ]);
    $this->assertModelMissing($user);

    Notification::assertSentOnDemand(
        MembershipApplicationReviewed::class,
        fn (MembershipApplicationReviewed $notification, array $channels, object $notifiable): bool => $channels === ['mail']
            && ! $notification->approved
    );
});

test('review notifications escape applicant names in email content', function () {
    $application = MembershipApplication::factory()->create([
        'full_name' => "Ana <script>alert('xss')</script>",
    ]);

    $emailContent = (new MembershipApplicationReviewed($application, approved: true))
        ->toMail(new AnonymousNotifiable)
        ->render()
        ->toHtml();

    expect($emailContent)
        ->toContain('&lt;script&gt;')
        ->not->toContain("<script>alert('xss')</script>");
});
