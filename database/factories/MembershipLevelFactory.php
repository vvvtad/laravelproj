<?php

namespace Database\Factories;

use App\Models\MembershipCategory;
use App\Models\MembershipLevel;
use Illuminate\Database\Eloquent\Factories\Factory;

class MembershipLevelFactory extends Factory
{
    protected $model = MembershipLevel::class;

    public function definition(): array
    {
        return [
            'membership_category_id' => MembershipCategory::factory(),
            'name' => fake()->randomElement(['Basic', 'Silver', 'Gold', 'Platinum']),
            'fee' => fake()->randomFloat(2, 50, 5000),
            'validity_days' => 365,
            'benefits' => fake()->sentence(),
            'is_active' => true,
        ];
    }
}
