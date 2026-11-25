<!doctype html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="{{ asset('css/style.css') }}">
    <title>Accounts</title>
</head>

<body>
    @include('nav')

    <main class="page-container">
        <h2>User Accounts</h2>

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

        <section class="management-grid">
            <form class="account-create-form" action="{{ route('accounts.store') }}" method="POST">
                @csrf
                <h3>Create account</h3>

                <label for="account-name">Name</label>
                <input id="account-name" type="text" name="name" value="{{ old('name') }}" required maxlength="255">

                <label for="account-email">Email</label>
                <input id="account-email" type="email" name="email" value="{{ old('email') }}" required maxlength="255">

                <label for="account-password">Temporary password</label>
                <input id="account-password" type="password" name="password" required autocomplete="new-password">

                <label for="account-password-confirmation">Confirm temporary password</label>
                <input id="account-password-confirmation" type="password" name="password_confirmation" required autocomplete="new-password">

                <label for="account-role">Role</label>
                <select id="account-role" name="role" required>
                    <option value="member" @selected(old('role', 'member') === 'member')>Member</option>
                    <option value="admin" @selected(old('role') === 'admin')>Administrator</option>
                </select>

                <label for="account-member">Member record</label>
                <select id="account-member" name="member_id">
                    <option value="">Not linked</option>
                    @foreach ($members as $member)
                    <option
                        value="{{ $member->id }}"
                        @selected(old('member_id') == $member->id)
                        @disabled($member->user !== null)
                    >
                        {{ $member->membership_number }} - {{ $member->first_name }} {{ $member->last_name }}
                    </option>
                    @endforeach
                </select>
                <p>Member accounts require an unlinked member record. Administrator accounts do not use one.</p>

                <button type="submit">Create account</button>
            </form>

            <section class="management-list">
                <h3>Existing accounts</h3>
                <table>
                    <thead>
                        <tr>
                            <th>Name and email</th>
                            <th>Member record</th>
                            <th>Login access</th>
                            <th>Access</th>
                        </tr>
                    </thead>
                    <tbody>
                        @forelse ($accounts as $account)
                        <tr>
                            <td>{{ $account->name }}<br>{{ $account->email }}</td>
                            <td>{{ $account->member?->membership_number ?? 'Not linked' }}</td>
                            <td>{{ $account->is_active ? 'Enabled' : 'Pending approval' }}</td>
                            <td>
                                @if ($account->is_active)
                                <form
                                    class="account-row-form"
                                    action="{{ route('accounts.update', $account) }}"
                                    method="POST"
                                >
                                    @csrf
                                    @method('PUT')

                                    <label for="role-{{ $account->id }}">Role</label>
                                    <select id="role-{{ $account->id }}" name="role" required>
                                        <option value="member" @selected($account->role === 'member')>Member</option>
                                        <option value="admin" @selected($account->role === 'admin')>Administrator</option>
                                    </select>

                                    <label for="member-{{ $account->id }}">Member record</label>
                                    <select id="member-{{ $account->id }}" name="member_id">
                                        <option value="">Not linked</option>
                                        @foreach ($members as $member)
                                        <option
                                            value="{{ $member->id }}"
                                            @selected($account->member_id === $member->id)
                                            @disabled($member->user !== null && $member->user->id !== $account->id)
                                        >
                                            {{ $member->membership_number }} - {{ $member->first_name }} {{ $member->last_name }}
                                        </option>
                                        @endforeach
                                    </select>

                                    <button type="submit" class="small-button">Save access</button>
                                </form>
                                @else
                                <span>Review this account from Membership Applications.</span>
                                @endif
                            </td>
                        </tr>
                        @empty
                        <tr>
                            <td colspan="4">No accounts have been created.</td>
                        </tr>
                        @endforelse
                    </tbody>
                </table>
            </section>
        </section>
    </main>
</body>

</html>
