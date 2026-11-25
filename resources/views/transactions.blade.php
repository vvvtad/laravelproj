<!doctype html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="{{ asset('css/style.css') }}">
    <title>Transactions</title>
</head>

<body>
    @include('nav')

    <main class="page-container">
        <h2>Transactions</h2>

        @if (session('success'))
        <div class="success-message">{{ session('success') }}</div>
        @endif
        @if ($errors->any())
        <div class="error-message">
            <ul>@foreach ($errors->all() as $error)<li>{{ $error }}</li>@endforeach</ul>
        </div>
        @endif

        @isset($selectedTransaction)
        <section class="transaction-detail">
            <h3>{{ $selectedTransaction->transaction_code }}</h3>
            <p><strong>Member:</strong> {{ $selectedTransaction->member->first_name }} {{ $selectedTransaction->member->last_name }}</p>
            <p><strong>Membership number:</strong> {{ $selectedTransaction->member->membership_number }}</p>
            <p><strong>Type:</strong> {{ ucfirst($selectedTransaction->type) }}</p>
            <p><strong>Amount:</strong> ${{ number_format((float) $selectedTransaction->amount, 2) }}</p>
            <p><strong>Status:</strong> {{ ucfirst($selectedTransaction->status) }}</p>

            <form action="{{ route('transactions.update', $selectedTransaction) }}" method="POST">
                @csrf
                @method('PUT')
                <label for="transaction-status">Update status</label>
                <select id="transaction-status" name="status" required>
                    @foreach (['pending', 'paid', 'approved', 'expired', 'cancelled'] as $status)
                    <option value="{{ $status }}" @selected($selectedTransaction->status === $status)>{{ ucfirst($status) }}</option>
                    @endforeach
                </select>
                <button type="submit">Update status</button>
            </form>

            <h4>Payments</h4>
            @forelse ($selectedTransaction->payments as $payment)
            <p>{{ $payment->reference_number }} - ${{ number_format((float) $payment->amount, 2) }} - {{ ucfirst($payment->status) }}</p>
            @empty
            <p>No payments recorded.</p>
            @endforelse
        </section>
        @endisset

        <section class="management-grid transaction-grid">
            <form action="{{ route('transactions.store') }}" method="POST">
                @csrf
                <h3>Create transaction</h3>
                <label for="transaction-member">Member</label>
                <select id="transaction-member" name="member_id" required>
                    <option value="">Choose a member</option>
                    @foreach ($members as $member)
                    <option value="{{ $member->id }}">{{ $member->membership_number }} - {{ $member->first_name }} {{ $member->last_name }}</option>
                    @endforeach
                </select>

                <label for="transaction-type">Type</label>
                <select id="transaction-type" name="type" required>
                    <option value="application">Membership application</option>
                    <option value="renewal">Membership renewal</option>
                </select>

                <label for="transaction-amount">Amount</label>
                <input id="transaction-amount" type="number" name="amount" min="0.01" step="0.01" required>
                <button type="submit">Create transaction</button>
            </form>

            <section class="management-list">
                <form action="{{ route('transactions.index') }}" method="GET" class="filter-form">
                    <div class="filter-field">
                        <label for="transaction-search">Search</label>
                        <input id="transaction-search" type="search" name="search" value="{{ $search }}">
                    </div>
                    <div class="filter-field">
                        <label for="status-filter">Status</label>
                        <select id="status-filter" name="status">
                            <option value="">All statuses</option>
                            @foreach (['pending', 'paid', 'approved', 'expired', 'cancelled'] as $status)
                            <option value="{{ $status }}" @selected($statusFilter===$status)>{{ ucfirst($status) }}</option>
                            @endforeach
                        </select>
                    </div>
                    <button type="submit">Search</button>
                </form>

                <table>
                    <thead>
                        <tr>
                            <th>Reference</th>
                            <th>Member</th>
                            <th>Type</th>
                            <th>Amount</th>
                            <th>Status</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        @foreach ($transactions as $transaction)
                        <tr>
                            <td>{{ $transaction->transaction_code }}</td>
                            <td>{{ $transaction->member->first_name }} {{ $transaction->member->last_name }}</td>
                            <td>{{ ucfirst($transaction->type) }}</td>
                            <td>${{ number_format((float) $transaction->amount, 2) }}</td>
                            <td>{{ ucfirst($transaction->status) }}</td>
                            <td class="action-buttons">
                                <a class="editbtn" href="{{ route('transactions.show', $transaction) }}">View</a>
                                <form action="{{ route('transactions.destroy', $transaction) }}" method="POST" class="delete-form" onsubmit="return confirm('Cancel this transaction?');">
                                    @csrf
                                    @method('DELETE')
                                    <button type="submit">Cancel</button>
                                </form>
                            </td>
                        </tr>
                        @endforeach
                    </tbody>
                </table>
            </section>
        </section>
    </main>
</body>

</html>