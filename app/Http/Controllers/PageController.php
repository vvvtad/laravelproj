<?php

namespace App\Http\Controllers;

use App\Models\Member;
use App\Models\MembershipLevel;
use App\Models\MembershipTransaction;
use App\Models\Payment;
use Illuminate\Contracts\View\View;
use Illuminate\Http\Request;

class PageController extends Controller
{
    public function dashboard(Request $request): View
    {
        $dashboardData = [
            'pricingLevels' => MembershipLevel::with('category')
                ->where('is_active', true)
                ->whereHas('category', fn ($query) => $query->where('is_active', true))
                ->orderBy('fee')
                ->get(),
        ];

        if ($request->user()->isAdmin()) {
            $dashboardData += [
                'totalMembers' => Member::count(),
                'activeMembers' => Member::where('status', 'active')->count(),
                'pendingTransactions' => MembershipTransaction::where('status', 'pending')->count(),
                'collectedPayments' => Payment::where('status', 'paid')->sum('amount'),
            ];
        } else {
            $dashboardData['member'] = $request->user()->member()
                ->with(['category', 'level'])
                ->first();
        }

        return view('dashboard', $dashboardData);
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
