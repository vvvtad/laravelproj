<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="{{ asset('css/style.css') }}">
    <title>Tasks</title>
</head>
<body>
    @include('nav')

    <main class="page-container">
        <h2>Tasks</h2>

        @if (session('success'))
        <div class="success-message" role="status">{{ session('success') }}</div>
        @endif

        @if ($errors->any())
        <div class="error-message" role="alert">
            <ul>
                @foreach ($errors->all() as $error)
                <li>{{ $error }}</li>
                @endforeach
            </ul>
        </div>
        @endif

        @if (auth()->user()->isAdmin())
        <section class="task-create-panel">
            <h3>Add a task</h3>
            <form class="task-create-form" action="{{ route('tasks.store') }}" method="POST">
                @csrf
                <label for="task_title">Task title</label>
                <input type="text" id="task_title" name="task_title" value="{{ old('task_title') }}">

                <label for="description">Description</label>
                <textarea id="description" name="description">{{ old('description') }}</textarea>

                <button type="submit">Add Task</button>
            </form>
        </section>
        @endif

        @if ($tasks->isNotEmpty())
        <section class="management-list">
            <table class="task-table">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Task</th>
                        <th>Description</th>
                        @if (auth()->user()->isAdmin())
                        <th>Actions</th>
                        @endif
                    </tr>
                </thead>
                <tbody>
                    @foreach ($tasks as $task)
                    <tr>
                        <td>{{ $task->id }}</td>
                        <td>
                            <p>{{ $task->task_title }}</p>
                        </td>
                        <td>
                            <p>{{ $task->description }}</p>
                        </td>
                        @if (auth()->user()->isAdmin())
                        <td class="action-buttons">
                            <a class="editbtn" href="{{ route('tasks.edit', $task->id) }}">Edit</a>
                            <form
                                action="{{ route('tasks.destroy', $task) }}"
                                method="POST"
                                class="delete-form"
                                onsubmit="return confirm('Are you sure you want to delete this task?');">
                                @csrf
                                @method('DELETE')
                                <button type="submit">Delete</button>
                            </form>
                        </td>
                        @endif
                    </tr>
                    @endforeach
                </tbody>
            </table>
        </section>
        @else
        <p class="no-tasks">No tasks found.</p>
        @endif
    </main>
</body>
</html>