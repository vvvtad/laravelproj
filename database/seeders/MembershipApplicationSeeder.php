<?php

namespace Database\Seeders;

use App\Models\MembershipApplication;
use App\Models\MembershipCategory;
use Illuminate\Database\Seeder;

class MembershipApplicationSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $category = MembershipCategory::firstOrCreate(
            ['slug' => 'demo-applications'],
            [
                'name' => 'Demo Applications',
                'description' => 'Development sample category',
                'is_active' => true,
            ]
        );

        MembershipApplication::firstOrCreate(
            ['reference_no' => 'MEM-DEMO-0001'],
            [
                'membership_category_id' => $category->id,
                'full_name' => 'Sample Applicant',
                'email' => 'applicant@example.test',
                'phone' => null,
                'address' => null,
                'latitude' => 14.5995,
                'longitude' => 120.9842,
                'status' => 'pending',
            ]
        );
    }
}
