<!doctype html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="{{ asset('css/style.css') }}">
    <title>Member and Admin Sign In</title>
</head>

<body>
    @include('nav')

    <main class="auth-page">
        <section class="auth-card">
            <h1>Member and Admin Sign In</h1>
            <p>Access your member or administrator account.</p>

            @if ($errors->any())
            <div class="error-message" role="alert">
                {{ $errors->first() }}
            </div>
            @endif

            <form class="auth-form" method="POST" action="{{ route('login.store') }}">
                @csrf

                <div class="auth-field">
                    <label for="email">Email</label>
                    <input
                        id="email"
                        type="email"
                        name="email"
                        value="{{ old('email') }}"
                        autocomplete="username"
                        required
                        autofocus
                    >
                </div>

                <div class="auth-field">
                    <label for="password">Password</label>
                    <input
                        id="password"
                        type="password"
                        name="password"
                        autocomplete="current-password"
                        required>
                </div>

                <label class="auth-remember" for="remember">
                    <input id="remember" type="checkbox" name="remember" value="1">
                    Remember me
                </label>

                <button type="submit">Sign in</button>
            </form>

            <p class="auth-apply-link">
                Applying for membership? <a href="{{ route('membership.create') }}">Start your application</a>.
            </p>
        </section>
    </main>
</body>

</html>
