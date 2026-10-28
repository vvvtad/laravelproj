<?php

namespace App\Http\Controllers;

use App\Models\Member;
use App\Models\MembershipCategory;
use App\Models\MembershipLevel;
use Illuminate\Http\Request;
use Illuminate\Support\Str;

class MemberController extends Controller
{
    private function ensureDefaultMembershipCatalog(): void
    {
        if (MembershipCategory::count() > 0 && MembershipLevel::count() > 0) {
            return;
        }

        $catalog = [
            'Student' => [
                'Basic' => 0,
                'Silver' => 600,
                'Gold' => 150,
                'Platinum' => 350,
            ],
            'Regular' => [
                'Basic' => 0,
                'Silver' => 600,
                'Gold' => 150,
                'Platinum' => 350,
            ],
            'Senior Citizen' => [
                'Basic' => 0,
                'Silver' => 600,
                'Gold' => 150,
                'Platinum' => 350,
            ],
            'Corporate' => [
                'Basic' => 0,
                'Silver' => 600,
                'Gold' => 150,
                'Platinum' => 350,
            ],
        ];

        foreach ($catalog as $categoryName => $levels) {
            $category = MembershipCategory::firstOrCreate(
                ['slug' => Str::slug($categoryName)],
                [
                    'name' => $categoryName,
                    'slug' => Str::slug($categoryName),
                    'description' => $categoryName.' membership',
                    'is_active' => true,
                ]
            );

            foreach ($levels as $levelName => $fee) {
                MembershipLevel::firstOrCreate(
                    [
                        'membership_category_id' => $category->id,
                        'name' => $levelName,
                    ],
                    [
                        'membership_category_id' => $category->id,
                        'name' => $levelName,
                        'fee' => $fee,
                        'validity_days' => 365,
                        'benefits' => $levelName.' access and benefits',
                        'is_active' => true,
                    ]
                );
            }
        }
    }

    private function activeCategories()
    {
        $this->ensureDefaultMembershipCatalog();

        return MembershipCategory::where('is_active', true)->get();
    }

    private function activeLevels()
    {
        $this->ensureDefaultMembershipCatalog();

        return MembershipLevel::where('is_active', true)
            ->orderBy('membership_category_id')
            ->orderBy('name')
            ->get();
    }

    private function searchableLevels()
    {
        $this->ensureDefaultMembershipCatalog();

        return MembershipLevel::where('is_active', true)
            ->orderBy('name')
            ->get()
            ->unique('name')
            ->values();
    }

    public function index(Request $request)
    {
        $search = trim((string) $request->input('search', ''));
        $categoryFilter = $request->input('category');
        $levelFilter = $request->input('level');

        $members = Member::with(['category', 'level'])
            ->when($search !== '', function ($query) use ($search) {
                $query->where(function ($query) use ($search) {
                    $query->where('first_name', 'like', "%{$search}%")
                        ->orWhere('last_name', 'like', "%{$search}%")
                        ->orWhere('email', 'like', "%{$search}%");
                });
            })
            ->when($categoryFilter, function ($query, $categoryFilter) {
                $query->whereHas('category', function ($subQuery) use ($categoryFilter) {
                    $subQuery->where('name', $categoryFilter)
                        ->orWhere('slug', $categoryFilter);
                });
            })
            ->when($levelFilter, function ($query, $levelFilter) {
                $query->whereHas('level', function ($subQuery) use ($levelFilter) {
                    $subQuery->where('name', $levelFilter);
                });
            })
            ->latest()
            ->get();

        return view('members.index', [
            'members' => $members,
            'categories' => $this->activeCategories(),
            'levels' => $this->activeLevels(),
            'searchLevels' => $this->searchableLevels(),
            'search' => $search,
            'categoryFilter' => $categoryFilter,
            'levelFilter' => $levelFilter,
        ]);
    }

    public function create()
    {
        return view('members.index', [
            'members' => Member::with(['category', 'level'])->latest()->get(),
            'categories' => $this->activeCategories(),
            'levels' => $this->activeLevels(),
            'searchLevels' => $this->searchableLevels(),
            'search' => '',
            'categoryFilter' => null,
            'levelFilter' => null,
        ]);
    }

    public function store(Request $request)
    {
        $validated = $request->validate([
            'first_name' => ['required', 'string', 'max:255'],
            'last_name' => ['required', 'string', 'max:255'],
            'email' => ['required', 'email', 'max:255', 'unique:members,email'],
            'phone' => ['nullable', 'string', 'max:255'],
            'address' => ['nullable', 'string'],
            'membership_category_id' => ['required', 'exists:membership_categories,id'],
            'membership_level_id' => ['required', 'exists:membership_levels,id'],
            'status' => ['required', 'in:active,inactive,pending,deactivated'],
            'notes' => ['nullable', 'string'],
        ]);

        $category = MembershipCategory::findOrFail($validated['membership_category_id']);
        $level = MembershipLevel::findOrFail($validated['membership_level_id']);

        if ((int) $level->membership_category_id !== (int) $category->id) {
            return back()->withErrors([
                'membership_level_id' => 'The selected membership level does not belong to the selected category.',
            ])->withInput();
        }

        $validated['membership_number'] = Member::generateMembershipNumber();
        $validated['starts_at'] = now()->toDateString();
        $validated['expires_at'] = now()->addDays($level->validity_days ?? 365)->toDateString();

        Member::create($validated);

        return redirect()->route('members.index')->with('success', 'Member added successfully.');
    }

    public function show(Member $member)
    {
        return view('members.show', [
            'member' => $member,
            'categories' => $this->activeCategories(),
            'levels' => $this->activeLevels(),
        ]);
    }

    public function edit(Member $member)
    {
        return view('members.show', [
            'member' => $member,
            'categories' => $this->activeCategories(),
            'levels' => $this->activeLevels(),
            'editing' => true,
        ]);
    }

    public function update(Request $request, Member $member)
    {
        $validated = $request->validate([
            'first_name' => ['required', 'string', 'max:255'],
            'last_name' => ['required', 'string', 'max:255'],
            'email' => ['required', 'email', 'max:255', 'unique:members,email,'.$member->id],
            'phone' => ['nullable', 'string', 'max:255'],
            'address' => ['nullable', 'string'],
            'membership_category_id' => ['required', 'exists:membership_categories,id'],
            'membership_level_id' => ['required', 'exists:membership_levels,id'],
            'status' => ['required', 'in:active,inactive,pending,deactivated'],
            'notes' => ['nullable', 'string'],
        ]);

        $category = MembershipCategory::findOrFail($validated['membership_category_id']);
        $level = MembershipLevel::findOrFail($validated['membership_level_id']);

        if ((int) $level->membership_category_id !== (int) $category->id) {
            return back()->withErrors([
                'membership_level_id' => 'The selected membership level does not belong to the selected category.',
            ])->withInput();
        }

        $validated['starts_at'] = $member->starts_at ?? now()->toDateString();
        $validated['expires_at'] = $member->expires_at ?? now()->addDays($level->validity_days ?? 365)->toDateString();

        $member->update($validated);

        return redirect()->route('members.show', $member)->with('success', 'Member details updated successfully.');
    }

    public function destroy(Member $member)
    {
        $member->update(['status' => 'deactivated']);

        return redirect()->route('members.index')->with('success', 'Member deactivated successfully.');
    }

    public function delete(Member $member)
    {
        $member->delete();

        return redirect()->route('members.index')->with('success', 'Member account deleted successfully.');
    }
}
