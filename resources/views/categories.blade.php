<!doctype html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="{{ asset('css/style.css') }}">
    <title>Membership Categories</title>
</head>

<body>
    @include('nav')

    <main class="page-container">
        <h2>Membership Categories</h2>

        @if (session('success'))
        <div class="success-message">{{ session('success') }}</div>
        @endif
        @if ($errors->any())
        <div class="error-message">
            <ul>@foreach ($errors->all() as $error)<li>{{ $error }}</li>@endforeach</ul>
        </div>
        @endif

        <section class="management-grid">
            <form action="{{ route('categories.store') }}" method="POST">
                @csrf
                <h3>Add category</h3>
                <label for="category-name">Name</label>
                <input id="category-name" type="text" name="name" value="{{ old('name') }}" required>

                <label for="category-description">Description</label>
                <textarea id="category-description" name="description">{{ old('description') }}</textarea>

                <label for="category-status">Status</label>
                <select id="category-status" name="is_active" required>
                    <option value="1" selected>Active</option>
                    <option value="0">Inactive</option>
                </select>

                <button type="submit">Add category</button>
            </form>

            <section class="management-list">
                <table>
                    <thead>
                        <tr>
                            <th>Name</th>
                            <th>Description</th>
                            <th>Members</th>
                            <th>Status</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        @foreach ($categories as $category)
                        <tr>
                            <td>{{ $category->name }}</td>
                            <td>{{ $category->description ?: 'Not provided' }}</td>
                            <td>{{ $category->members_count }}</td>
                            <td>{{ $category->is_active ? 'Active' : 'Inactive' }}</td>
                            <td class="action-buttons">
                                <form action="{{ route('categories.update', $category) }}" method="POST" class="inline-management-form">
                                    @csrf
                                    @method('PUT')
                                    <input type="hidden" name="name" value="{{ $category->name }}">
                                    <input type="hidden" name="description" value="{{ $category->description }}">
                                    <input type="hidden" name="is_active" value="{{ $category->is_active ? 0 : 1 }}">
                                    <button type="submit" class="small-button">{{ $category->is_active ? 'Deactivate' : 'Activate' }}</button>
                                </form>
                                <form action="{{ route('categories.destroy', $category) }}" method="POST" class="delete-form" onsubmit="return confirm('Delete this category?');">
                                    @csrf
                                    @method('DELETE')
                                    <button type="submit">Delete</button>
                                </form>
                            </td>
                        </tr>
                        @endforeach
                    </tbody>
                </table>
            </section>
        </section>
    </main>
</body>

</html>