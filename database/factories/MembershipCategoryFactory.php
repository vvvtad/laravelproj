<?php

namespace Database\Factories;

use App\Models\MembershipCategory;
use Illuminate\Database\Eloquent\Factories\Factory;

class MembershipCategoryFactory extends Factory
{
    protected $model = MembershipCategory::class;

    public function definition(): array
    {
        return [
            'name' => fake()->randomElement(['Student', 'Regular', 'Senior Citizen', 'Corporate']),
            'slug' => fake()->unique()->slug(),
            'description' => fake()->sentence(),
            'is_active' => true,
        ];
    }
}
