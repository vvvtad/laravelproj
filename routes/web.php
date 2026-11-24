<?php

use App\Http\Controllers\CategoryController;
use App\Http\Controllers\LevelController;
use App\Http\Controllers\MemberController;
use App\Http\Controllers\PageController;
use App\Http\Controllers\PaymentController;
use App\Http\Controllers\TaskController;
use App\Http\Controllers\TransactionController;
use Illuminate\Support\Facades\Route;

Route::get('/', [PageController::class, 'dashboard'])->name('dashboard');

Route::get('/about', [PageController::class, 'about']);

Route::get('/tasks', [TaskController::class, 'index'])
    ->name('tasks.index');
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
Route::resource('transactions', TransactionController::class)->except(['create', 'edit']);
Route::resource('payments', PaymentController::class)->except(['create', 'show', 'edit']);
