<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="{{ asset('css/style.css') }}">
    <title>Dashboard</title>
</head>
<body>
@include('nav')

<main class="page-container">
    <h2>Membership Dashboard</h2>

    @if (auth()->user()->isAdmin())
    <section class="dashboard-grid">
        <article class="dashboard-card">
            <span>Total members</span>
            <strong>{{ $totalMembers }}</strong>
        </article>
        <article class="dashboard-card">
            <span>Active members</span>
            <strong>{{ $activeMembers }}</strong>
        </article>
        <article class="dashboard-card">
            <span>Pending transactions</span>
            <strong>{{ $pendingTransactions }}</strong>
        </article>
        <article class="dashboard-card">
            <span>Collected payments</span>
            <strong>${{ number_format((float) $collectedPayments, 2) }}</strong>
        </article>
    </section>
    @else
    <section class="member-dashboard">
        @if ($member)
        <h3>Welcome, {{ $member->first_name }}</h3>
        <p><strong>Membership number:</strong> {{ $member->membership_number }}</p>
        <p><strong>Category:</strong> {{ $member->category->name }}</p>
        <p><strong>Level:</strong> {{ $member->level->name }}</p>
        <p><strong>Status:</strong> {{ ucfirst($member->status) }}</p>
        <p><strong>Expires:</strong> {{ $member->expires_at?->format('M j, Y') ?? 'Not set' }}</p>
        @else
        <p class="empty-pricing">Your account is not linked to a membership record. Please contact an administrator.</p>
        @endif
    </section>
    @endif

    <section class="pricing-section">
        <h3>Membership Pricing</h3>

        @if ($pricingLevels->isEmpty())
            <p class="empty-pricing">No active membership pricing available.</p>
        @else
            <div class="pricing-list">
                @foreach ($pricingLevels as $level)
                    <article class="pricing-card">
                        <div>
                            <span class="pricing-category">{{ $level->category->name }}</span>
                            <h4>{{ $level->name }}</h4>
                        </div>
                        <strong class="pricing-fee">${{ number_format((float) $level->fee, 2) }}</strong>
                        <span class="pricing-validity">{{ $level->validity_days }} days</span>
                        <p>{{ $level->benefits ?: 'Not provided' }}</p>
                    </article>
                @endforeach
            </div>
        @endif
    </section>
</main>
</body>
</html>
