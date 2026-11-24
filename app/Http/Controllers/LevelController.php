<?php

namespace App\Http\Controllers;

use App\Models\MembershipCategory;
use App\Models\MembershipLevel;
use Illuminate\Contracts\View\View;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Illuminate\Validation\Rule;

class LevelController extends Controller
{
    private const LEVEL_NAMES = ['Basic', 'Silver', 'Gold', 'Platinum'];

    public function index(): View
    {
        return view('levels', [
            'categories' => MembershipCategory::where('is_active', true)->get(),
            'levels' => MembershipLevel::with('category')
                ->whereIn('name', self::LEVEL_NAMES)
                ->where('is_active', true)
                ->latest()
                ->get(),
        ]);
    }

    public function store(Request $request): RedirectResponse
    {
        $validated = $request->validate([
            'membership_category_id' => ['required', 'exists:membership_categories,id'],
            'name' => ['required', Rule::in(self::LEVEL_NAMES)],
            'fee' => ['required', 'numeric', 'min:0'],
            'validity_days' => ['required', 'integer', 'min:1'],
            'benefits' => ['nullable', 'string'],
            'is_active' => ['required', 'boolean'],
        ]);

        MembershipLevel::updateOrCreate([
            'membership_category_id' => $validated['membership_category_id'],
            'name' => $validated['name'],
        ], $validated);

        return redirect()->route('levels.index')->with('success', 'Level saved successfully.');
    }

    public function update(Request $request, MembershipLevel $level): RedirectResponse
    {
        $validated = $request->validate([
            'membership_category_id' => ['required', 'exists:membership_categories,id'],
            'name' => ['required', Rule::in(self::LEVEL_NAMES)],
            'fee' => ['required', 'numeric', 'min:0'],
            'validity_days' => ['required', 'integer', 'min:1'],
            'benefits' => ['nullable', 'string'],
            'is_active' => ['required', 'boolean'],
        ]);

        $level->update($validated);

        return redirect()->route('levels.index')->with('success', 'Level updated successfully.');
    }

    public function destroy(MembershipLevel $level): RedirectResponse
    {
        $level->delete();

        return redirect()->route('levels.index')->with('success', 'Level deleted successfully.');
    }
}
