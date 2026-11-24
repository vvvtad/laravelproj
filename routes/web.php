<?php

use App\Http\Controllers\MemberController;
use App\Http\Controllers\PageController;
use App\Http\Controllers\TaskController;
use Illuminate\Support\Facades\Route;

Route::get('/', function () {
    return view('welcome');
});

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
Route::resource('members', MemberController::class);
