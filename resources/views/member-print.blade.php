<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="{{ asset('css/style.css') }}">
    <title>Membership Record</title>
</head>
<body class="print-page">
<main class="print-record">
    <h2>Official Membership Record</h2>
    <p><strong>Membership number:</strong> {{ $member->membership_number }}</p>
    <p><strong>Name:</strong> {{ $member->first_name }} {{ $member->last_name }}</p>
    <p><strong>Email:</strong> {{ $member->email }}</p>
    <p><strong>Phone:</strong> {{ $member->phone ?: 'Not provided' }}</p>
    <p><strong>Address:</strong> {{ $member->address ?: 'Not provided' }}</p>
    <p><strong>Category:</strong> {{ $member->category->name }}</p>
    <p><strong>Level:</strong> {{ $member->level->name }}</p>
    <p><strong>Status:</strong> {{ ucfirst($member->status) }}</p>
    <p><strong>Starts:</strong> {{ $member->starts_at?->toDateString() ?: 'Not set' }}</p>
    <p><strong>Expires:</strong> {{ $member->expires_at?->toDateString() ?: 'Not set' }}</p>

    <h3>Transaction History</h3>
    @forelse ($member->transactions as $transaction)
    <p>
        {{ $transaction->transaction_code }} -
        {{ ucfirst($transaction->type) }} -
        ${{ number_format((float) $transaction->amount, 2) }} -
        {{ ucfirst($transaction->status) }}
    </p>
    @empty
    <p>No transactions found.</p>
    @endforelse

    <button type="button" class="no-print" onclick="window.print()">Print</button>
</main>
</body>
</html>
