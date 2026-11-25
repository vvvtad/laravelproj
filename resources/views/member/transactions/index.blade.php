<!doctype html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="{{ asset('css/style.css') }}">
    <title>Transaction History | Membership Portal</title>
</head>

<body>
    @include('nav')

    <main class="page-container">
        <h2>Transaction History</h2>

        <section class="management-list">
            @if ($transactions->isEmpty())
                <p>No transaction history is available for your account.</p>
            @else
                <table>
                    <thead>
                        <tr>
                            <th scope="col">Reference</th>
                            <th scope="col">Type</th>
                            <th scope="col">Amount</th>
                            <th scope="col">Status</th>
                            <th scope="col">Date</th>
                        </tr>
                    </thead>
                    <tbody>
                        @foreach ($transactions as $transaction)
                            <tr>
                                <td>{{ $transaction->transaction_code }}</td>
                                <td>{{ ucfirst($transaction->type) }}</td>
                                <td>${{ number_format((float) $transaction->amount, 2) }}</td>
                                <td>{{ ucfirst($transaction->status) }}</td>
                                <td>{{ $transaction->created_at->format('M j, Y') }}</td>
                            </tr>
                        @endforeach
                    </tbody>
                </table>
            @endif
        </section>
    </main>
</body>

</html>
