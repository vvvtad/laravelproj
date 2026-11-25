<!doctype html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="{{ asset('css/style.css') }}">
    <title>My Account</title>
</head>

<body>
    @include('nav')

    <main class="page-container">
        <h2>My Account</h2>

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

        <section class="account-panel">
            <h3>Login details</h3>
            <p><strong>Name:</strong> {{ $user->name }}</p>
            <p><strong>Email:</strong> {{ $user->email }}</p>
            <p><strong>Account type:</strong> {{ ucfirst($user->role) }}</p>
        </section>

        @if ($user->member)
        <section class="account-panel">
            <h3>Membership</h3>
            <p><strong>Membership number:</strong> {{ $user->member->membership_number }}</p>
            <p><strong>Name:</strong> {{ $user->member->first_name }} {{ $user->member->last_name }}</p>
            <p><strong>Category:</strong> {{ $user->member->category->name }}</p>
            <p><strong>Level:</strong> {{ $user->member->level->name }}</p>
            <p><strong>Status:</strong> {{ ucfirst($user->member->status) }}</p>
            <p><strong>Expires:</strong> {{ $user->member->expires_at?->format('M j, Y') ?? 'Not set' }}</p>
        </section>
        @elseif ($user->isMember())
        <div class="error-message" role="status">
            Your account is not linked to a membership record. Please contact an administrator.
        </div>
        @endif

        <section class="account-panel">
            <h3>Change password</h3>
            <form class="account-password-form" action="{{ route('account.password.update') }}" method="POST">
                @csrf
                @method('PUT')

                <label for="current-password">Current password</label>
                <input id="current-password" type="password" name="current_password" autocomplete="current-password" required>

                <label for="new-password">New password</label>
                <input id="new-password" type="password" name="password" autocomplete="new-password" required>

                <label for="new-password-confirmation">Confirm new password</label>
                <input id="new-password-confirmation" type="password" name="password_confirmation" autocomplete="new-password" required>

                <button type="submit">Update password</button>
            </form>
        </section>
    </main>
</body>

</html>
