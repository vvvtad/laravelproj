<!doctype html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="{{ asset('css/style.css') }}">
    <title>Membership Levels</title>
</head>

<body>
    @include('nav')

    <main class="page-container">
        <h2>Membership Levels</h2>

        @if (session('success'))
        <div class="success-message">{{ session('success') }}</div>
        @endif
        @if ($errors->any())
        <div class="error-message">
            <ul>@foreach ($errors->all() as $error)<li>{{ $error }}</li>@endforeach</ul>
        </div>
        @endif

        <section class="management-grid">
            <form action="{{ route('levels.store') }}" method="POST">
                @csrf
                <h3>Add level</h3>
                <label for="level-category">Category</label>
                <select id="level-category" name="membership_category_id" required>
                    <option value="">Choose a category</option>
                    @foreach ($categories as $category)
                    <option value="{{ $category->id }}">{{ $category->name }}</option>
                    @endforeach
                </select>

                <label for="level-name">Level</label>
                <select id="level-name" name="name" required>
                    @foreach (['Basic', 'Silver', 'Gold', 'Platinum'] as $name)
                    <option value="{{ $name }}">{{ $name }}</option>
                    @endforeach
                </select>

                <label for="level-fee">Fee</label>
                <input id="level-fee" type="number" name="fee" min="0" step="0.01" value="{{ old('fee', '0') }}" required>

                <label for="level-validity">Validity (days)</label>
                <input id="level-validity" type="number" name="validity_days" min="1" value="{{ old('validity_days', '365') }}" required>

                <label for="level-benefits">Benefits</label>
                <textarea id="level-benefits" name="benefits">{{ old('benefits') }}</textarea>

                <input type="hidden" name="is_active" value="1">
                <button type="submit">Save level</button>
            </form>

            <section class="management-list">
                <table>
                    <thead>
                        <tr>
                            <th>Category</th>
                            <th>Level</th>
                            <th>Fee</th>
                            <th>Validity</th>
                            <th>Benefits</th>
                            <th>Status</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        @foreach ($levels as $level)
                        <tr>
                            <td>{{ $level->category->name }}</td>
                            <td>{{ $level->name }}</td>
                            <td>${{ number_format((float) $level->fee, 2) }}</td>
                            <td>{{ $level->validity_days }} days</td>
                            <td>{{ $level->benefits ?: 'Not provided' }}</td>
                            <td>{{ $level->is_active ? 'Active' : 'Inactive' }}</td>
                            <td class="action-buttons">
                                <form action="{{ route('levels.destroy', $level) }}" method="POST" class="delete-form" onsubmit="return confirm('Delete this level?');">
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