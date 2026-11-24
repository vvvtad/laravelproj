<?php

namespace App\Http\Controllers;

use App\Models\Task;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use LogicException;

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

        Task::create($validated);

        return redirect()->route('tasks.index')
            ->with('success', 'Task created successfully.');
    }

    public function edit(int $id)
    {
        $task = Task::findOrFail($id);

        return view('edit', compact('task'));
    }

    public function update(Request $request, int $id)
    {
        $task = Task::findOrFail($id);

        if ($request->isMethod('patch')) {
            $validated = $request->validate([
                'task_title' => 'sometimes|required|string|max:255',
                'description' => 'sometimes|nullable|string',
            ]);
        } else {
            $validated = $request->validate([
                'task_title' => 'required|string|max:255',
                'description' => 'nullable|string',
            ]);
        }

        $task->update($validated);

        return redirect()->route('tasks.index')
            ->with('success', 'Task updated successfully.');
    }

    public function destroy(Task $task)
    {
        $task->delete();

        if (Task::doesntExist()) {
            $this->resetTaskIdSequence();
        }

        return redirect()->route('tasks.index')
            ->with('success', 'Task deleted successfully.');
    }

    private function resetTaskIdSequence(): void
    {
        $connection = DB::connection();
        $table = (new Task)->getTable();

        switch ($connection->getDriverName()) {
            case 'mysql':
            case 'mariadb':
                $wrappedTable = $connection->getQueryGrammar()->wrapTable($table);
                $connection->statement("ALTER TABLE {$wrappedTable} AUTO_INCREMENT = 1");
                break;
            case 'sqlite':
                $connection->statement(
                    'DELETE FROM sqlite_sequence WHERE name = ?',
                    [$connection->getTablePrefix().$table],
                );
                break;
            default:
                throw new LogicException(sprintf(
                    'Resetting task IDs is not supported for the [%s] database driver.',
                    $connection->getDriverName(),
                ));
        }
    }
}
