<?php

use App\Http\Controllers\AccountController;
use App\Http\Controllers\Auth\AuthenticatedSessionController;
use App\Http\Controllers\CategoryController;
use App\Http\Controllers\LevelController;
use App\Http\Controllers\MemberController;
use App\Http\Controllers\MembershipApplicationController;
use App\Http\Controllers\PageController;
use App\Http\Controllers\PaymentController;
use App\Http\Controllers\TaskController;
use App\Http\Controllers\TransactionController;
use App\Http\Controllers\UserController;
use App\Http\Controllers\WeatherController;
use Illuminate\Support\Facades\Route;

Route::middleware('guest')->group(function () {
    Route::get('/login', [AuthenticatedSessionController::class, 'create'])
        ->name('login');
    Route::post('/login', [AuthenticatedSessionController::class, 'store'])
        ->middleware('throttle:login')
        ->name('login.store');
});

Route::post('/logout', [AuthenticatedSessionController::class, 'destroy'])
    ->middleware('auth')
    ->name('logout');

Route::get('/about', [PageController::class, 'about']);

Route::get('/membership/apply', [MembershipApplicationController::class, 'create'])
    ->name('membership.create');
Route::post('/membership/apply', [MembershipApplicationController::class, 'store'])
    ->middleware('throttle:5,1')
    ->name('membership.store');
Route::get('/weather', [WeatherController::class, 'show'])
    ->middleware('throttle:60,1')
    ->name('weather.show');

Route::middleware('auth')->group(function () {
    Route::get('/', [PageController::class, 'dashboard'])->name('dashboard');
    Route::get('/account', [AccountController::class, 'show'])
        ->name('account.show');
    Route::put('/account/password', [AccountController::class, 'updatePassword'])
        ->name('account.password.update');
    Route::get('/transactions', [TransactionController::class, 'index'])
        ->name('transactions.index');

    Route::get('/tasks', [TaskController::class, 'index'])
        ->name('tasks.index');

    Route::middleware('admin')->group(function () {
        Route::post('/tasks', [TaskController::class, 'store'])
            ->name('tasks.store');
        Route::get('/tasks/{id}/edit', [TaskController::class, 'edit'])
            ->name('tasks.edit');
        Route::put('/tasks/{id}', [TaskController::class, 'update'])
            ->name('tasks.update');
        Route::patch('/tasks/{id}', [TaskController::class, 'update']);
        Route::delete('/tasks/{task}', [TaskController::class, 'destroy'])
            ->name('tasks.destroy');

        Route::delete('/members/{member}/delete', [MemberController::class, 'delete'])
            ->name('members.delete');
        Route::get('/members/{member}/print', [MemberController::class, 'print'])
            ->name('members.print');
        Route::resource('members', MemberController::class);
        Route::resource('categories', CategoryController::class)->except(['create', 'show', 'edit']);
        Route::resource('levels', LevelController::class)->except(['create', 'show', 'edit']);
        Route::resource('transactions', TransactionController::class)
            ->except(['index', 'create', 'edit']);
        Route::resource('payments', PaymentController::class)->except(['create', 'show', 'edit']);
        Route::get('/accounts', [UserController::class, 'index'])
            ->name('accounts.index');
        Route::post('/accounts', [UserController::class, 'store'])
            ->name('accounts.store');
        Route::put('/accounts/{user}', [UserController::class, 'update'])
            ->name('accounts.update');

        Route::get('/membership/applications', [MembershipApplicationController::class, 'index'])
            ->name('membership-applications.index');
        Route::post('/membership/applications/{application}/approve', [MembershipApplicationController::class, 'approve'])
            ->name('membership-applications.approve');
        Route::post('/membership/applications/{application}/reject', [MembershipApplicationController::class, 'reject'])
            ->name('membership-applications.reject');
    });
});
