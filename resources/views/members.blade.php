<!doctype html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="{{ asset('css/style.css') }}">
    <title>Members</title>
</head>

<body>
    @include('nav')

    <div class="membercontainer">
        @php
        $selectedMember = $selectedMember ?? null;
        $editingMember = $editingMember ?? null;
        @endphp

        <h2>Members</h2>

        @if (session('success'))
        <div class="success-message">{{ session('success') }}</div>
        @endif

        @if ($errors->any())
        <div class="error-message">
            <ul>
                @foreach ($errors->all() as $error)
                <li>{{ $error }}</li>
                @endforeach
            </ul>
        </div>
        @endif

        <section class="searchcontainer">
            <form action="{{ route('members.index') }}" method="GET">
                <h3>Search members</h3>

                <label for="search">Name or email</label>
                <input id="search" type="search" name="search" value="{{ $search }}">

                <label for="category">Category</label>
                <select id="category" name="category">
                    <option value="">All categories</option>
                    @foreach ($categories as $category)
                    <option value="{{ $category->slug }}" @selected($categoryFilter===$category->slug)>
                        {{ $category->name }}
                    </option>
                    @endforeach
                </select>

                <label for="level">Level</label>
                <select id="level" name="level">
                    <option value="">All levels</option>
                    @foreach ($searchLevels as $level)
                    <option value="{{ $level->name }}" @selected($levelFilter===$level->name)>
                        {{ $level->name }}
                    </option>
                    @endforeach
                </select>

                <div class="additional-button">
                    <button type="submit">Search</button>
                    <a href="{{ route('members.index') }}">Clear</a>
                </div>
            </form>
        </section>


        <section class="memberwindowcontainer">
            @if (!$selectedMember || $editingMember)
            <form
                action="{{ $editingMember ? route('members.update', $editingMember) : route('members.store') }}"
                method="POST">
                @csrf
                @if ($editingMember)
                @method('PUT')
                @endif
                <h3>{{ $editingMember ? 'Edit member' : 'Add a member' }}</h3>

                <label for="first_name">First name</label>
                <input id="first_name" type="text" name="first_name" value="{{ old('first_name', $editingMember?->first_name) }}" required>

                <label for="last_name">Last name</label>
                <input id="last_name" type="text" name="last_name" value="{{ old('last_name', $editingMember?->last_name) }}" required>

                <label for="email">Email</label>
                <input id="email" type="email" name="email" value="{{ old('email', $editingMember?->email) }}" required>

                <label for="phone">Phone</label>
                <input id="phone" type="text" name="phone" value="{{ old('phone', $editingMember?->phone) }}">

                <label for="address">Address</label>
                <textarea id="address" name="address">{{ old('address', $editingMember?->address) }}</textarea>

                <label for="membership_category_id">Membership category</label>
                <select id="membership_category_id" name="membership_category_id" required>
                    <option value="">Choose a category</option>
                    @foreach ($categories as $category)
                    <option value="{{ $category->id }}" @selected((string) old('membership_category_id', $editingMember?->membership_category_id) === (string) $category->id)>
                        {{ $category->name }}
                    </option>
                    @endforeach
                </select>

                <label for="membership_level_id">Membership level</label>
                <select id="membership_level_id" name="membership_level_id" required>
                    <option value="">Choose a level</option>
                    @foreach ($levels as $level)
                    <option value="{{ $level->id }}" @selected((string) old('membership_level_id', $editingMember?->membership_level_id) === (string) $level->id)>
                        {{ $level->category->name }}: {{ $level->name }} (${{ number_format((float) $level->fee, 2) }})
                    </option>
                    @endforeach
                </select>

                <label for="status">Status</label>
                <select id="status" name="status" required>
                    @foreach (['active', 'inactive', 'pending', 'deactivated'] as $status)
                    <option value="{{ $status }}" @selected(old('status', $editingMember?->status ?? 'active') === $status)>
                        {{ ucfirst($status) }}
                    </option>
                    @endforeach
                </select>

                <label for="notes">Notes</label>
                <textarea id="notes" name="notes">{{ old('notes', $editingMember?->notes) }}</textarea>

                <button type="submit">{{ $editingMember ? 'Save changes' : 'Add member' }}</button>
                @if ($editingMember)
                <a class="editbtn" href="{{ route('members.show', $editingMember) }}">Cancel</a>
                @endif
            </form>
            @endif

            @if ($selectedMember)
            <section>
                <h3>Member details</h3>
                <p><strong>Membership number:</strong> {{ $selectedMember->membership_number }}</p>
                <p><strong>Name:</strong> {{ $selectedMember->first_name }} {{ $selectedMember->last_name }}</p>
                <p><strong>Email:</strong> {{ $selectedMember->email }}</p>
                <p><strong>Phone:</strong> {{ $selectedMember->phone ?: 'Not provided' }}</p>
                <p><strong>Address:</strong> {{ $selectedMember->address ?: 'Not provided' }}</p>
                <p><strong>Category:</strong> {{ $selectedMember->category->name }}</p>
                <p><strong>Level:</strong> {{ $selectedMember->level->name }}</p>
                <p><strong>Status:</strong> {{ ucfirst($selectedMember->status) }}</p>
                <p><strong>Starts:</strong> {{ $selectedMember->starts_at?->toDateString() ?: 'Not set' }}</p>
                <p><strong>Expires:</strong> {{ $selectedMember->expires_at?->toDateString() ?: 'Not set' }}</p>
                @if ($selectedMember->notes)
                <p><strong>Notes:</strong> {{ $selectedMember->notes }}</p>
                @endif

                <div class="additional-button">
                    <a href="{{ route('members.edit', $selectedMember) }}">Edit</a>
                    <a href="{{ route('members.index') }}">Back</a>
                </div>

                <h4>Transactions</h4>
                @forelse ($selectedMember->transactions as $transaction)
                <p>
                    {{ $transaction->transaction_code }} -
                    {{ ucfirst($transaction->type) }} -
                    ${{ number_format((float) $transaction->amount, 2) }} -
                    {{ ucfirst($transaction->status) }}
                </p>
                @empty
                <p>No transactions found.</p>
                @endforelse

                <h4>Payments</h4>
                @forelse ($selectedMember->payments as $payment)
                <p>
                    {{ $payment->transaction->transaction_code }} -
                    {{ ucfirst($payment->payment_method) }} -
                    ${{ number_format((float) $payment->amount, 2) }} -
                    {{ ucfirst($payment->status) }}
                </p>
                @empty
                <p>No payments found.</p>
                @endforelse
            </section>
            @endif
        </section>

        <div class="memberlistcontainer">
            <h3>Member list</h3>
            @if ($members->isNotEmpty())
            <table>
                <thead>
                    <tr>
                        <th>Membership number</th>
                        <th>Name</th>
                        <th>Email</th>
                        <th>Category</th>
                        <th>Level</th>
                        <th>Status</th>
                    </tr>
                </thead>
                <tbody>
                    @foreach ($members as $member)
                    <tr>
                        <td>{{ $member->membership_number }}</td>
                        <td>{{ $member->first_name }} {{ $member->last_name }}</td>
                        <td>{{ $member->email }}</td>
                        <td>{{ $member->category->name }}</td>
                        <td>{{ $member->level->name }}</td>
                        <td>{{ ucfirst($member->status) }}</td>
                        <td class="action-buttons">
                            <a class="editbtn" href="{{ route('members.show', $member) }}">View</a>
                            <a class="editbtn" href="{{ route('members.edit', $member) }}">Edit</a>
                            @if ($member->status !== 'deactivated')
                            <form
                                action="{{ route('members.destroy', $member) }}"
                                method="POST"
                                class="delete-form"
                                onsubmit="return confirm('Deactivate this member?');">
                                @csrf
                                @method('DELETE')
                                <button type="submit">Deactivate</button>
                            </form>
                            @endif
                            @if ($member->status === 'deactivated')
                            <form
                                action="{{ route('members.delete', $member) }}"
                                method="POST"
                                class="delete-form"
                                onsubmit="return confirm('Permanently delete this member and all related transactions and payments?');">
                                @csrf
                                @method('DELETE')
                                <button type="submit">Delete</button>
                            </form>
                            @endif
                        </td>
                    </tr>
                    @endforeach
                </tbody>
            </table>
            @else
            <p>No members found.</p>
            @endif
        </div>
    </div>
</body>

</html>