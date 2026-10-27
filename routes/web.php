<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\PageController;
use App\Http\Controllers\TaskController;

Route::get('/', function () {
    return view('welcome');
});

Route::get('/about', [PageController::class, 'about']);

Route::get('/tasks', [TaskController::class, 'index'])
    ->name('tasks.index');
Route::post('/tasks', [TaskController::class, 'store'])
    ->name('tasks.store');