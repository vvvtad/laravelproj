<?php

namespace App\Http\Controllers;

use App\Models\MembershipTransaction;
use App\Models\Payment;
use Illuminate\Contracts\View\View;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;

class PaymentController extends Controller
{
    public function index(): View
    {
        return view('payments', [
            'payments' => Payment::with(['member', 'transaction'])->latest()->get(),
            'transactions' => MembershipTransaction::with('member')
                ->whereIn('status', ['pending', 'paid', 'approved'])
                ->latest()
                ->get(),
        ]);
    }

    public function store(Request $request): RedirectResponse
    {
        $validated = $request->validate([
            'membership_transaction_id' => ['required', 'exists:membership_transactions,id'],
            'amount' => ['required', 'numeric', 'min:0.01'],
            'payment_method' => ['required', 'in:cash,card,gcash,bank_transfer'],
            'status' => ['required', 'in:pending,paid,failed,refunded'],
        ]);

        $transaction = MembershipTransaction::findOrFail($validated['membership_transaction_id']);
        $payment = Payment::create([
            'member_id' => $transaction->member_id,
            'membership_transaction_id' => $transaction->id,
            'amount' => $validated['amount'],
            'payment_method' => $validated['payment_method'],
            'status' => $validated['status'],
        ]);

        if ($payment->status === 'paid') {
            $transaction->update(['status' => 'paid']);
        }

        return redirect()->route('payments.index')->with('success', 'Payment recorded successfully.');
    }

    public function update(Request $request, Payment $payment): RedirectResponse
    {
        $validated = $request->validate([
            'status' => ['required', 'in:pending,paid,failed,refunded'],
        ]);

        $payment->update($validated);

        if ($validated['status'] === 'paid') {
            $payment->transaction->update(['status' => 'paid']);
        }

        return redirect()->route('payments.index')->with('success', 'Payment status updated successfully.');
    }

    public function destroy(Payment $payment): RedirectResponse
    {
        $payment->delete();

        return redirect()->route('payments.index')->with('success', 'Payment deleted successfully.');
    }
}
