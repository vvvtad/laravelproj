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
</main>
</body>
</html>
