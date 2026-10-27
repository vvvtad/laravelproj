<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="{{ asset('css/style.css') }}">
    <title>Tasks</title>
</head>
<body>
    <nav>
        <h1> My Tasks</h1>
    </nav>

    <form action="{{ route('tasks.store') }}" method="POST">
        @csrf
        <label for='task_title'>Task Title</label><br>
        <input type="text" id="task_title" name="task_title" 
        value="{{ old('task_title') }}"><br><br>

        <label for='description'>Description</label><br>
        <textarea id="description" name="description">
            {{ old('description') }}</textarea><br><br>

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