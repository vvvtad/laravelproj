<?php

use App\Models\User;
use Illuminate\Foundation\Testing\RefreshDatabase;

uses(RefreshDatabase::class);

test('login page links to the public membership application', function () {
    $this->get(route('login'))
        ->assertOk()
        ->assertSee(route('membership.create'))
        ->assertSee('Member and Admin Sign In')
        ->assertDontSee('Admin Account')
        ->assertDontSee('Staff login');

    $this->get(route('membership.create'))
        ->assertOk();
});

test('users can sign in and access the protected dashboard', function () {
    $user = User::factory()->create();

    $this->get(route('dashboard'))
        ->assertRedirect(route('login'));

    $this->post(route('login.store'), [
        'email' => $user->email,
        'password' => 'password',
    ])->assertRedirect(route('dashboard'));

    $this->assertAuthenticatedAs($user);
});

test('invalid credentials return a generic login error', function () {
    $user = User::factory()->create();

    $this->from(route('login'))
        ->post(route('login.store'), [
            'email' => $user->email,
            'password' => 'incorrect-password',
        ])
        ->assertRedirect(route('login'))
        ->assertSessionHasErrors([
            'email' => __('auth.failed'),
        ]);

    $this->assertGuest();
});

test('login rejects a non-string email address', function () {
    $this->post(route('login.store'), [
        'email' => ['member@example.test'],
        'password' => 'password',
    ])->assertSessionHasErrors('email');

    $this->assertGuest();
});

test('users can log out and their session is cleared', function () {
    $user = User::factory()->create();

    $this->actingAs($user)
        ->post(route('logout'))
        ->assertRedirect(route('login'));

    $this->assertGuest();
});

test('management pages redirect guests to login', function () {
    $this->get(route('payments.index'))
        ->assertRedirect(route('login'));
});

test('login attempts are rate limited per email and ip', function () {
    $credentials = [
        'email' => 'member@example.test',
        'password' => 'incorrect-password',
    ];

    for ($attempt = 0; $attempt < 5; $attempt++) {
        $this->post(route('login.store'), $credentials);
    }

    $this->post(route('login.store'), $credentials)
        ->assertTooManyRequests();
});
