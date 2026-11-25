<nav aria-label="Primary navigation">
    <div class="nav-container">
        @guest
        <a class="nav-brand" href="{{ route('membership.create') }}">Membership Portal</a>
        @endguest
        @auth
        <a class="nav-brand" href="{{ route('dashboard') }}">Membership Portal</a>
        @endauth
        <ul>
            @guest
            <li><a href="{{ route('membership.create') }}">Sign Up</a></li>
            <li><a href="{{ route('login') }}">Sign In</a></li>
            @endguest
            @auth
            <li><a href="{{ route('dashboard') }}">Dashboard</a></li>
            <li><a href="{{ route('tasks.index') }}">Tasks</a></li>
            <li><a href="{{ route('transactions.index') }}">Transactions</a></li>
            <li><a href="{{ route('account.show') }}">Account</a></li>

            @if (auth()->user()->isAdmin())
            <li><a href="{{ route('membership.create') }}">Apply</a></li>
            <li><a href="{{ route('membership-applications.index') }}">Applications</a></li>
            <li><a href="{{ route('members.index') }}">Members</a></li>
            <li><a href="{{ route('categories.index') }}">Categories</a></li>
            <li><a href="{{ route('levels.index') }}">Levels</a></li>
            <li><a href="{{ route('payments.index') }}">Payments</a></li>
            <li><a href="{{ route('accounts.index') }}">Accounts</a></li>
            @endif

            <li>
                <form class="nav-logout-form" method="POST" action="{{ route('logout') }}">
                    @csrf
                    <button type="submit">Log out</button>
                </form>
            </li>
            @endauth
        </ul>
    </div>
</nav>

