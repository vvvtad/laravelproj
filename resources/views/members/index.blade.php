<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Member Management</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 2rem; background: #f4f7fb; color: #1f2937; }
        .container { max-width: 1200px; margin: 0 auto; }
        .grid { display: grid; grid-template-columns: 360px 1fr; gap: 1.5rem; }
        .panel { background: #fff; border-radius: 12px; padding: 1.25rem; box-shadow: 0 8px 18px rgba(31,41,55,0.08); }
        h1, h2, h3 { margin-top: 0; }
        form { display: grid; gap: 0.9rem; }
        .row { display: grid; grid-template-columns: repeat(2, minmax(0, 1fr)); gap: 0.75rem; }
        label { display: block; font-size: 0.82rem; font-weight: 600; margin-bottom: 0.35rem; }
        input, select, textarea, button { width: 100%; box-sizing: border-box; padding: 0.7rem; border-radius: 8px; border: 1px solid #d1d5db; font-size: 0.95rem; }
        button { background: #0f172a; color: white; border: 0; cursor: pointer; }
        button.secondary { background: #2563eb; }
        table { width: 100%; border-collapse: collapse; margin-top: 1rem; }
        th, td { border-bottom: 1px solid #e5e7eb; padding: 0.8rem 0.6rem; text-align: left; }
        .badge { display: inline-block; padding: 0.25rem 0.6rem; border-radius: 9999px; background: #dcfce7; color: #166534; font-size: 0.75rem; font-weight: 700; }
        .muted { color: #6b7280; }
        .error { color: #b91c1c; font-size: 0.8rem; }
        .success { background: #dcfce7; color: #166534; padding: 0.75rem 1rem; border-radius: 8px; margin-bottom: 1rem; }
        .actions { display: flex; gap: 0.5rem; }
        .actions a, .actions form { display: inline; }
        .action-link { text-decoration: none; color: #1d4ed8; }
    </style>
</head>
<body>
    <div class="container">
        <h1>Member Management</h1>

        @if (session('success'))
            <div class="success">{{ session('success') }}</div>
        @endif

        <div class="grid">
            <div class="panel">
                <h2>Add Member</h2>
                <form method="POST" action="{{ route('members.store') }}">
                    @csrf
                    <div class="row">
                        <div>
                            <label for="first_name">First Name</label>
                            <input id="first_name" name="first_name" value="{{ old('first_name') }}" required>
                            @error('first_name') <div class="error">{{ $message }}</div> @enderror
                        </div>
                        <div>
                            <label for="last_name">Last Name</label>
                            <input id="last_name" name="last_name" value="{{ old('last_name') }}" required>
                            @error('last_name') <div class="error">{{ $message }}</div> @enderror
                        </div>
                    </div>

                    <div>
                        <label for="email">Email</label>
                        <input id="email" name="email" type="email" value="{{ old('email') }}" required>
                        @error('email') <div class="error">{{ $message }}</div> @enderror
                    </div>

                    <div>
                        <label for="phone">Phone</label>
                        <input id="phone" name="phone" value="{{ old('phone') }}">
                    </div>

                    <div>
                        <label for="address">Address</label>
                        <textarea id="address" name="address" rows="3">{{ old('address') }}</textarea>
                    </div>

                    <div class="row">
                        <div>
                            <label for="membership_category_id">Category</label>
                            <select id="membership_category_id" name="membership_category_id" required>
                                <option value="">Select category</option>
                                @foreach ($categories as $category)
                                    <option value="{{ $category->id }}" {{ old('membership_category_id') == $category->id ? 'selected' : '' }}>{{ $category->name }}</option>
                                @endforeach
                            </select>
                            @error('membership_category_id') <div class="error">{{ $message }}</div> @enderror
                        </div>
                        <div>
                            <label for="membership_level_id">Membership Level</label>
                            <select id="membership_level_id" name="membership_level_id" required>
                                <option value="">Select level</option>
                            </select>
                            @error('membership_level_id') <div class="error">{{ $message }}</div> @enderror
                        </div>
                    </div>

                    <script>
                        const categorySelect = document.getElementById('membership_category_id');
                        const levelSelect = document.getElementById('membership_level_id');
                        const allLevelOptions = @json($levels->unique('name')->values()->map(function ($level) {
                            return ['id' => (string) $level->id, 'name' => $level->name, 'fee' => (float) $level->fee];
                        })->all());
                        const levelOptionsByCategory = @json($levels->groupBy('membership_category_id')->map(function ($group) {
                            return $group->map(function ($level) {
                                return ['id' => (string) $level->id, 'name' => $level->name, 'fee' => (float) $level->fee];
                            })->unique('name')->values()->all();
                        })->all());
                        const selectedCategory = @json(old('membership_category_id'));
                        const selectedLevel = @json(old('membership_level_id'));

                        function populateLevels() {
                            const categoryId = categorySelect.value || selectedCategory;
                            const options = categoryId ? (levelOptionsByCategory[categoryId] || allLevelOptions) : allLevelOptions;

                            levelSelect.innerHTML = '<option value="">Select level</option>';

                            options.forEach(function (level) {
                                const option = document.createElement('option');
                                option.value = level.id;
                                option.textContent = level.name + ' (' + Number(level.fee).toFixed(0) + ' PHP)';

                                if (selectedLevel && String(level.id) === String(selectedLevel)) {
                                    option.selected = true;
                                }

                                levelSelect.appendChild(option);
                            });
                        }

                        categorySelect.addEventListener('change', populateLevels);
                        populateLevels();
                    </script>

                    <div class="row">
                        <div>
                            <label for="status">Status</label>
                            <select id="status" name="status" required>
                                <option value="active" {{ old('status', 'active') === 'active' ? 'selected' : '' }}>Active</option>
                                <option value="pending" {{ old('status') === 'pending' ? 'selected' : '' }}>Pending</option>
                                <option value="inactive" {{ old('status') === 'inactive' ? 'selected' : '' }}>Inactive</option>
                                <option value="deactivated" {{ old('status') === 'deactivated' ? 'selected' : '' }}>Deactivated</option>
                            </select>
                        </div>
                        <div>
                            <label for="notes">Notes</label>
                            <textarea id="notes" name="notes" rows="3">{{ old('notes') }}</textarea>
                        </div>
                    </div>

                    <button type="submit">Save Member</button>
                </form>
            </div>

            <div class="panel">
                <h2>Search Members</h2>
                <form method="GET" action="{{ route('members.index') }}">
                    <div class="row">
                        <div>
                            <label for="search">Name or Email</label>
                            <input id="search" name="search" value="{{ $search }}" placeholder="Search by name or email">
                        </div>
                        <div>
                            <label for="category">Category</label>
                            <select id="category" name="category">
                                <option value="">All categories</option>
                                @foreach ($categories as $category)
                                    <option value="{{ $category->name }}" {{ $categoryFilter === $category->name ? 'selected' : '' }}>{{ $category->name }}</option>
                                @endforeach
                            </select>
                        </div>
                    </div>

                    <div class="row">
                        <div>
                            <label for="level">Membership Level</label>
                            <select id="level" name="level">
                                <option value="">All levels</option>
                                @foreach ($searchLevels ?? $levels as $level)
                                    <option value="{{ $level->name }}" {{ $levelFilter === $level->name ? 'selected' : '' }}>{{ $level->name }}</option>
                                @endforeach
                            </select>
                        </div>
                        <div>
                            <button type="submit" class="secondary">Apply Filters</button>
                        </div>
                    </div>

                    <script>
                        const filterCategorySelect = document.getElementById('category');
                        const filterLevelSelect = document.getElementById('level');
                        const categories = @json($categories->map(fn ($category) => ['id' => $category->id, 'name' => $category->name])->all());
                        const levelsByCategory = @json($levels->groupBy('membership_category_id')->map(function ($group) {
                            return $group->map(function ($level) {
                                return ['id' => (string) $level->id, 'name' => $level->name];
                            })->unique('name')->values()->all();
                        })->all());
                        const selectedFilterCategory = @json($categoryFilter);
                        const selectedFilterLevel = @json($levelFilter);

                        function populateFilterLevels() {
                            const categoryName = filterCategorySelect.value || selectedFilterCategory || '';
                            const category = categories.find(item => item.name === categoryName);
                            const categoryId = category ? category.id : null;
                            const sourceLevels = categoryId ? (levelsByCategory[categoryId] || []) : @json($searchLevels->map(fn ($level) => ['name' => $level->name])->all());

                            filterLevelSelect.innerHTML = '<option value="">All levels</option>';

                            sourceLevels.forEach(function (level) {
                                const option = document.createElement('option');
                                option.value = level.name;
                                option.textContent = level.name;

                                if (selectedFilterLevel === level.name) {
                                    option.selected = true;
                                }

                                filterLevelSelect.appendChild(option);
                            });
                        }

                        filterCategorySelect.addEventListener('change', populateFilterLevels);
                        populateFilterLevels();
                    </script>
                </form>

                <table>
                    <thead>
                        <tr>
                            <th>Member</th>
                            <th>Category</th>
                            <th>Level</th>
                            <th>Status</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        @forelse ($members as $member)
                            <tr>
                                <td>
                                    <strong>{{ $member->first_name }} {{ $member->last_name }}</strong><br>
                                    <span class="muted">{{ $member->membership_number }}</span>
                                </td>
                                <td>{{ $member->category?->name ?? 'N/A' }}</td>
                                <td>{{ $member->level?->name ?? 'N/A' }}</td>
                                <td><span class="badge">{{ ucfirst($member->status) }}</span></td>
                                <td class="actions">
                                    <a class="action-link" href="{{ route('members.show', $member) }}">View</a>
                                    <a class="action-link" href="{{ route('members.edit', $member) }}">Edit</a>
                                    <form method="POST" action="{{ route('members.destroy', $member) }}" onsubmit="return confirm('Deactivate this member?');">
                                        @csrf
                                        @method('DELETE')
                                        <button type="submit" style="background:#f59e0b; padding:0.45rem 0.7rem;">Deactivate</button>
                                    </form>
                                    <form method="POST" action="{{ route('members.delete', $member) }}" onsubmit="return confirm('Delete this member account permanently?');">
                                        @csrf
                                        @method('DELETE')
                                        <button type="submit" style="background:#dc2626; padding:0.45rem 0.7rem;">Delete</button>
                                    </form>
                                </td>
                            </tr>
                        @empty
                            <tr>
                                <td colspan="5" class="muted">No members found.</td>
                            </tr>
                        @endforelse
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</body>
</html>
