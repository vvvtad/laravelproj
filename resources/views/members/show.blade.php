<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Member Profile</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 2rem; background: #f4f7fb; color: #1f2937; }
        .container { max-width: 900px; margin: 0 auto; }
        .panel { background: #fff; border-radius: 12px; padding: 1.5rem; box-shadow: 0 8px 18px rgba(31,41,55,0.08); }
        .profile-grid { display: grid; grid-template-columns: 1.2fr 0.8fr; gap: 1.5rem; }
        .muted { color: #6b7280; }
        .field { margin-bottom: 1rem; }
        label { display: block; font-size: 0.8rem; font-weight: 700; margin-bottom: 0.35rem; }
        input, textarea, select, button { width: 100%; box-sizing: border-box; padding: 0.7rem; border-radius: 8px; border: 1px solid #d1d5db; font-size: 0.95rem; }
        button { background: #111827; color: #fff; border: 0; cursor: pointer; }
        .error { color: #b91c1c; font-size: 0.8rem; }
        .success { background: #dcfce7; color: #166534; padding: 0.75rem 1rem; border-radius: 8px; margin-bottom: 1rem; }
    </style>
</head>
<body>
    <div class="container">
        @if (session('success'))
            <div class="success">{{ session('success') }}</div>
        @endif

        <div class="profile-grid">
            <div class="panel">
                <h1>Member Profile</h1>
                <div class="field"><strong>Membership Number:</strong> {{ $member->membership_number }}</div>
                <div class="field"><strong>Name:</strong> {{ $member->first_name }} {{ $member->last_name }}</div>
                <div class="field"><strong>Email:</strong> {{ $member->email }}</div>
                <div class="field"><strong>Phone:</strong> {{ $member->phone ?? 'N/A' }}</div>
                <div class="field"><strong>Address:</strong> {{ $member->address ?? 'N/A' }}</div>
                <div class="field"><strong>Category:</strong> {{ $member->category?->name ?? 'N/A' }}</div>
                <div class="field"><strong>Level:</strong> {{ $member->level?->name ?? 'N/A' }}</div>
                <div class="field"><strong>Status:</strong> {{ ucfirst($member->status) }}</div>
                <div class="field"><strong>Starts At:</strong> {{ $member->starts_at?->format('M d, Y') ?? 'N/A' }}</div>
                <div class="field"><strong>Expires At:</strong> {{ $member->expires_at?->format('M d, Y') ?? 'N/A' }}</div>
                <div class="field"><strong>Notes:</strong> {{ $member->notes ?? 'N/A' }}</div>
                <a href="{{ route('members.index') }}">Back to Members</a>
            </div>

            <div class="panel">
                <h2>{{ isset($editing) && $editing ? 'Edit Member' : 'Update Member' }}</h2>
                <form method="POST" action="{{ route('members.update', $member) }}">
                    @csrf
                    @method('PUT')
                    <div class="field">
                        <label for="first_name">First Name</label>
                        <input id="first_name" name="first_name" value="{{ old('first_name', $member->first_name) }}" required>
                        @error('first_name') <div class="error">{{ $message }}</div> @enderror
                    </div>
                    <div class="field">
                        <label for="last_name">Last Name</label>
                        <input id="last_name" name="last_name" value="{{ old('last_name', $member->last_name) }}" required>
                        @error('last_name') <div class="error">{{ $message }}</div> @enderror
                    </div>
                    <div class="field">
                        <label for="email">Email</label>
                        <input id="email" name="email" type="email" value="{{ old('email', $member->email) }}" required>
                        @error('email') <div class="error">{{ $message }}</div> @enderror
                    </div>
                    <div class="field">
                        <label for="phone">Phone</label>
                        <input id="phone" name="phone" value="{{ old('phone', $member->phone) }}">
                    </div>
                    <div class="field">
                        <label for="address">Address</label>
                        <textarea id="address" name="address" rows="3">{{ old('address', $member->address) }}</textarea>
                    </div>
                    <div class="field">
                        <label for="membership_category_id">Category</label>
                        <select id="membership_category_id" name="membership_category_id" required>
                            <option value="">Select category</option>
                            @foreach ($categories ?? [] as $category)
                                <option value="{{ $category->id }}" {{ old('membership_category_id', $member->membership_category_id) == $category->id ? 'selected' : '' }}>{{ $category->name }}</option>
                            @endforeach
                        </select>
                    </div>
                    <div class="field">
                        <label for="membership_level_id">Level</label>
                        <select id="membership_level_id" name="membership_level_id" required>
                            <option value="">Select level</option>
                        </select>
                    </div>

                    <script>
                        const editCategorySelect = document.getElementById('membership_category_id');
                        const editLevelSelect = document.getElementById('membership_level_id');
                        const editLevelsByCategory = @json(($levels ?? collect())->groupBy('membership_category_id')->map(function ($group) {
                            return $group->map(function ($level) {
                                return ['id' => (string) $level->id, 'name' => $level->name];
                            })->values()->all();
                        })->all());
                        const editSelectedCategory = @json(old('membership_category_id', $member->membership_category_id ?? null));
                        const editSelectedLevel = @json(old('membership_level_id', $member->membership_level_id ?? null));

                        function populateEditLevels() {
                            const categoryId = editCategorySelect.value || editSelectedCategory;
                            const options = editLevelsByCategory[categoryId] || [];

                            editLevelSelect.innerHTML = '<option value="">Select level</option>';

                            options.forEach(function (level) {
                                const option = document.createElement('option');
                                option.value = level.id;
                                option.textContent = level.name;

                                if (editSelectedLevel && String(level.id) === String(editSelectedLevel)) {
                                    option.selected = true;
                                }

                                editLevelSelect.appendChild(option);
                            });
                        }

                        editCategorySelect.addEventListener('change', populateEditLevels);
                        populateEditLevels();
                    </script>
                    <div class="field">
                        <label for="status">Status</label>
                        <select id="status" name="status" required>
                            @foreach (['active', 'inactive', 'pending', 'deactivated'] as $status)
                                <option value="{{ $status }}" {{ old('status', $member->status) === $status ? 'selected' : '' }}>{{ ucfirst($status) }}</option>
                            @endforeach
                        </select>
                    </div>
                    <div class="field">
                        <label for="notes">Notes</label>
                        <textarea id="notes" name="notes" rows="3">{{ old('notes', $member->notes) }}</textarea>
                    </div>
                    <button type="submit">Update Member</button>
                </form>
            </div>
        </div>
    </div>
</body>
</html>
