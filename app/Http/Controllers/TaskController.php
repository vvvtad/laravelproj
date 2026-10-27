<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Task;

class TaskController extends Controller
{
    public function index()
    {
        $tasks = Task::latest()->get();

        return view('tasks', compact('tasks'));
    }

    public function store(Request $request)
    {
        $validated = $request->validate([
            'task_title' => 'required|string|max:255',
            'description' => 'nullable|string',
        ]);

        return redirect()->route('tasks.index')
        ->with('success', 'Task created successfully.');
    }
}
