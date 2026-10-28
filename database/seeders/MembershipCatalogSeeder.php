<?php

namespace Database\Seeders;

use App\Models\MembershipCategory;
use App\Models\MembershipLevel;
use Illuminate\Database\Seeder;
use Illuminate\Support\Str;

class MembershipCatalogSeeder extends Seeder
{
    /**
     * Seed the default membership catalog.
     */
    public function run(): void
    {
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
}
