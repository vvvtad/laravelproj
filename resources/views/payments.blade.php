<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="{{ asset('css/style.css') }}">
    <title>Payments</title>
</head>
<body>
@include('nav')

<main class="page-container">
    <h2>Payments</h2>

    @if (session('success'))
    <div class="success-message">{{ session('success') }}</div>
    @endif
    @if ($errors->any())
    <div class="error-message"><ul>@foreach ($errors->all() as $error)<li>{{ $error }}</li>@endforeach</ul></div>
    @endif

    <section class="management-grid">
        <form action="{{ route('payments.store') }}" method="POST">
            @csrf
            <h3>Record payment</h3>
            <label for="payment-transaction">Transaction</label>
            <select id="payment-transaction" name="membership_transaction_id" required>
                <option value="">Choose a transaction</option>
                @foreach ($transactions as $transaction)
                <option value="{{ $transaction->id }}">
                    {{ $transaction->transaction_code }} - {{ $transaction->member->first_name }} {{ $transaction->member->last_name }} - ${{ number_format((float) $transaction->amount, 2) }}
                </option>
                @endforeach
            </select>

            <label for="payment-amount">Amount</label>
            <input id="payment-amount" type="number" name="amount" min="0.01" step="0.01" required>

            <label for="payment-method">Payment method</label>
            <select id="payment-method" name="payment_method" required>
                @foreach (['cash', 'card', 'gcash', 'bank_transfer'] as $method)
                <option value="{{ $method }}">{{ ucfirst(str_replace('_', ' ', $method)) }}</option>
                @endforeach
            </select>

            <label for="payment-status">Status</label>
            <select id="payment-status" name="status" required>
                @foreach (['pending', 'paid', 'failed', 'refunded'] as $status)
                <option value="{{ $status }}">{{ ucfirst($status) }}</option>
                @endforeach
            </select>

            <button type="submit">Record payment</button>
        </form>

        <section class="management-list">
            <table>
                <thead><tr><th>Reference</th><th>Member</th><th>Transaction</th><th>Amount</th><th>Method</th><th>Status</th><th>Actions</th></tr></thead>
                <tbody>
                @foreach ($payments as $payment)
                <tr>
                    <td>{{ $payment->reference_number }}</td>
                    <td>{{ $payment->member->first_name }} {{ $payment->member->last_name }}</td>
                    <td>{{ $payment->transaction->transaction_code }}</td>
                    <td>${{ number_format((float) $payment->amount, 2) }}</td>
                    <td>{{ ucfirst(str_replace('_', ' ', $payment->payment_method)) }}</td>
                    <td>{{ ucfirst($payment->status) }}</td>
                    <td class="action-buttons">
                        <form action="{{ route('payments.update', $payment) }}" method="POST" class="delete-form">
                            @csrf
                            @method('PUT')
                            <input type="hidden" name="status" value="paid">
                            <button type="submit">Mark paid</button>
                        </form>
                        <form action="{{ route('payments.destroy', $payment) }}" method="POST" class="delete-form" onsubmit="return confirm('Delete this payment?');">
                            @csrf
                            @method('DELETE')
                            <button type="submit">Delete</button>
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
