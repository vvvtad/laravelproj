<!doctype html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="{{ asset('css/style.css') }}">
    <title>Membership Applications</title>
</head>

<body>
    @include('nav')

    <main class="page-container">
        <h2>Membership Applications</h2>

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

        <section class="management-list">
            <table>
                <thead>
                    <tr>
                        <th>Applicant</th>
                        <th>Category</th>
                        <th>Status</th>
                        <th>Review</th>
                    </tr>
                </thead>
                <tbody>
                    @forelse ($applications as $application)
                    <tr>
                        <td>
                            {{ $application->full_name }}<br>
                            {{ $application->email }}<br>
                            {{ $application->phone ?? 'No phone provided' }}<br>
                            {{ $application->address ?? 'No address provided' }}<br>
                            @if ($application->latitude !== null && $application->longitude !== null)
                            Location: {{ $application->latitude }}, {{ $application->longitude }}<br>
                            @endif
                            Reference: {{ $application->reference_no }}
                        </td>
                        <td>{{ $application->category->name }}</td>
                        <td>
                            {{ ucfirst($application->status) }}
                            @if ($application->reviewed_at)
                            <br>{{ $application->reviewed_at->format('M j, Y g:i A') }}
                            @endif
                        </td>
                        <td>
                            @if ($application->status === \App\Models\MembershipApplication::STATUS_PENDING)
                            @if ($application->user)
                            <form action="{{ route('membership-applications.approve', $application) }}" method="POST">
                                @csrf
                                <label for="membership-level-{{ $application->id }}">Membership level</label>
                                <select id="membership-level-{{ $application->id }}" name="membership_level_id" required>
                                    <option value="">Choose a level</option>
                                    @foreach ($application->category->levels->where('is_active', true) as $level)
                                    <option value="{{ $level->id }}">
                                        {{ $level->name }} - {{ number_format((float) $level->fee, 2) }}
                                    </option>
                                    @endforeach
                                </select>
                                @if ($application->category->levels->where('is_active', true)->isEmpty())
                                <p>No active membership levels are available for this category.</p>
                                @endif
                                <button
                                    type="submit"
                                    class="small-button"
                                    @disabled($application->category->levels->where('is_active', true)->isEmpty())
                                >
                                    Approve
                                </button>
                            </form>
                            @else
                            <p>This older application has no linked login account. Ask the applicant to submit a new application.</p>
                            @endif

                            <form action="{{ route('membership-applications.reject', $application) }}" method="POST">
                                @csrf
                                <button type="submit" class="small-button">Reject</button>
                            </form>
                            @else
                            <span>{{ $application->user?->member?->membership_number ?? 'No active account' }}</span>
                            @endif
                        </td>
                    </tr>
                    @empty
                    <tr>
                        <td colspan="4">No membership applications have been submitted.</td>
                    </tr>
                    @endforelse
                </tbody>
            </table>
        </section>
    </main>
</body>

</html>
