<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tasks</title>
</head>
<body>
    <h1> My Tasks</h1>

    @if (session('success'))
        <div style="color: green;">
            {{ session('success') }}
        </div>
    @endif

    <form action="{{ route('tasks.store') }}" method="POST">
        @csrf
        <label for='task_title'>Task Title:</label><br>
        <input type="text" id="task_title" name="task_title" 
        value="{{ old('task_title') }}"
        required><br><br>

        @error('task_title')
            <div style="color: red;">{{ $message }}</div>
        @enderror

        <label for='description'>Description:</label><br>
        <textarea id="description" name="description">
            {{ old('description') }}</textarea><br><br>

        <button type="submit">Add Task</button>
    </form>

    @forelse ($tasks as $task)
        <article>
            <h3>{{ $task->task_title }}</h3>
            <p>{{ $task->description }}</p>
        </article>
    @empty
        <p>No tasks found.</p>
    @endforelse
</body>
</html>