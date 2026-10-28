<?php

use App\Http\Controllers\MemberController;
use App\Http\Controllers\PageController;
use App\Http\Controllers\TaskController;
use Illuminate\Support\Facades\Route;

Route::get('/', function () {
    return view('welcome');
});

Route::get('/about', [PageController::class, 'about']);

Route::resource('members', MemberController::class);
Route::delete('/members/{member}/delete', [MemberController::class, 'delete'])
    ->name('members.delete');

Route::get('/tasks', [TaskController::class, 'index'])
    ->name('tasks.index');
Route::post('/tasks', [TaskController::class, 'store'])
    ->name('tasks.store');
