<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="{{ asset('css/style.css') }}">
    <title>Edit Task</title>
</head>

<body>
    @include('nav')

    <form action="{{ route('tasks.update', $task->id) }}" method="POST">
        @csrf
        @method('PUT')

        <label for="task_title">Task Title</label><br>
        <input type="text" id="task_title" name="task_title"
            value="{{ old('task_title', $task->task_title) }}"><br><br>

        @error('task_title')
        <div class="error-message">
            {{ $message }}
        </div>
        @enderror

        <label for="description">Description</label><br>
        <textarea id="description" name="description">{{ old('description', $task->description) }}</textarea><br><br>

        <button type="submit">Save Changes</button>
    </form>
</body>

</html>
