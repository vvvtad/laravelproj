<?php

namespace App\Http\Controllers;

use App\Models\Member;
use App\Models\MembershipTransaction;
use App\Models\Payment;
use Illuminate\Contracts\View\View;

class PageController extends Controller
{
    public function dashboard(): View
    {
        return view('dashboard', [
            'totalMembers' => Member::count(),
            'activeMembers' => Member::where('status', 'active')->count(),
            'pendingTransactions' => MembershipTransaction::where('status', 'pending')->count(),
            'collectedPayments' => Payment::where('status', 'paid')->sum('amount'),
        ]);
    }

    public function about()
    {
        $data = [
            'course' => 'Web System Technologies',
            'module' => 'Laravel Foundations',
        ];

        return view('about', $data);
    }
}
