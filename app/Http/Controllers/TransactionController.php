<?php

namespace App\Http\Controllers;

use App\Models\Member;
use App\Models\MembershipTransaction;
use Illuminate\Contracts\View\View;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;

class TransactionController extends Controller
{
    public function index(Request $request): View
    {
        $user = $request->user();

        if (! $user->isAdmin()) {
            $transactions = $user->member?->transactions()
                ->latest()
                ->get() ?? collect();

            return view('member.transactions.index', [
                'transactions' => $transactions,
            ]);
        }

        $status = $request->string('status')->toString();
        $search = trim($request->string('search')->toString());

        $transactions = MembershipTransaction::with(['member', 'payments'])
            ->when($status !== '', fn ($query) => $query->where('status', $status))
            ->when($search !== '', function ($query) use ($search) {
                $query->where(function ($query) use ($search) {
                    $query->where('transaction_code', 'like', "%{$search}%")
                        ->orWhereHas('member', function ($memberQuery) use ($search) {
                            $memberQuery->where('first_name', 'like', "%{$search}%")
                                ->orWhere('last_name', 'like', "%{$search}%")
                                ->orWhere('membership_number', 'like', "%{$search}%");
                        });
                });
            })
            ->latest()
            ->get();

        return view('transactions', [
            'transactions' => $transactions,
            'members' => Member::where('status', '!=', 'deactivated')->latest()->get(),
            'statusFilter' => $status,
            'search' => $search,
        ]);
    }

    public function store(Request $request): RedirectResponse
    {
        $validated = $request->validate([
            'member_id' => ['required', 'exists:members,id'],
            'type' => ['required', 'in:application,renewal'],
            'amount' => ['required', 'numeric', 'min:0.01'],
        ]);

        $member = Member::findOrFail($validated['member_id']);
        $amount = (float) $validated['amount'];

        $transaction = MembershipTransaction::create([
            'member_id' => $member->id,
            'type' => $validated['type'],
            'amount' => $amount,
            'status' => 'pending',
        ]);

        return redirect()->route('transactions.show', $transaction)
            ->with('success', 'Transaction created successfully.');
    }

    public function show(MembershipTransaction $transaction): View
    {
        $transaction->load(['member.category', 'member.level', 'payments']);

        return view('transactions', [
            'selectedTransaction' => $transaction,
            'transactions' => MembershipTransaction::with(['member', 'payments'])->latest()->get(),
            'members' => Member::where('status', '!=', 'deactivated')->latest()->get(),
            'statusFilter' => '',
            'search' => '',
        ]);
    }

    public function update(Request $request, MembershipTransaction $transaction): RedirectResponse
    {
        $validated = $request->validate([
            'status' => ['required', 'in:pending,paid,approved,expired,cancelled'],
        ]);

        if ($validated['status'] === 'approved') {
            $hasPaidPayment = $transaction->payments()->where('status', 'paid')->exists();

            if (! $hasPaidPayment) {
                return back()->withErrors([
                    'status' => 'Only transactions with a paid payment may be marked as approved.',
                ]);
            }
        }

        $transaction->update($validated);

        if ($validated['status'] === 'approved') {
            $member = $transaction->member()->with('level')->first();
            $validityDays = (int) ($member->level->validity_days ?? 365);
            $startsAt = $transaction->type === 'renewal'
                && $member->expires_at
                && $member->expires_at->isFuture()
                    ? $member->expires_at
                    : now();

            $member->update([
                'status' => 'active',
                'starts_at' => $transaction->type === 'renewal' ? ($member->starts_at ?? now()) : now(),
                'expires_at' => $startsAt->copy()->addDays($validityDays),
            ]);
        }

        return redirect()->route('transactions.show', $transaction)
            ->with('success', 'Transaction status updated successfully.');
    }

    public function destroy(MembershipTransaction $transaction): RedirectResponse
    {
        $transaction->update(['status' => 'cancelled']);

        return redirect()->route('transactions.index')->with('success', 'Transaction cancelled successfully.');
    }
}
