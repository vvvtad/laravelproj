<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="{{ asset('css/style.css') }}">
    <title>Tasks</title>
</head>
<body>
    @include('nav')

    <form action="{{ route('tasks.store') }}" method="POST">
        @csrf
        <label for='task_title'>Task Title</label><br>
        <input type="text" id="task_title" name="task_title" 
        value="{{ old('task_title') }}"><br><br>

        <label for='description'>Description</label><br>
        <textarea id="description" name="description">{{ old('description') }}</textarea><br><br>

        <button type="submit">Add Task</button>

        @if (session('success'))
            <div class="success-message">
                {{ session('success') }}
            </div>
        @endif

        @error('task_title')
            <div class="error-message">
                {{ $message }}
            </div>
        @enderror
    </form>

    @if ($tasks->isNotEmpty())
        <table class="task-table">
            <tr>
                <th>ID</th>
                <th>Task</th>
                <th>Description</th>
            </tr>

            @foreach ($tasks as $task)
                <tr>
                    <td>{{ $task->id }}</td>
                    <td>
                        <p>{{ $task->task_title }}</p>
                    </td>
                    <td>
                        <p>{{ $task->description }}</p>
                    </td>
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
                </tr>
            @endforeach
        </table>
    @else
        <p class="no-tasks">No tasks found.</p>
    @endif

</body>
</html>