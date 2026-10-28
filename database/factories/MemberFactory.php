<?php

namespace Database\Factories;

use App\Models\Member;
use App\Models\MembershipCategory;
use App\Models\MembershipLevel;
use Illuminate\Database\Eloquent\Factories\Factory;

class MemberFactory extends Factory
{
    protected $model = Member::class;

    public function definition(): array
    {
        $category = MembershipCategory::factory()->create();
        $level = MembershipLevel::factory()->create([
            'membership_category_id' => $category->id,
        ]);

        return [
            'membership_number' => 'MEM-'.date('Ym').'-'.strtoupper(fake()->bothify('??????')),
            'first_name' => fake()->firstName(),
            'last_name' => fake()->lastName(),
            'email' => fake()->unique()->safeEmail(),
            'phone' => fake()->phoneNumber(),
            'address' => fake()->address(),
            'membership_category_id' => $category->id,
            'membership_level_id' => $level->id,
            'starts_at' => now()->toDateString(),
            'expires_at' => now()->addYear()->toDateString(),
            'status' => 'active',
            'notes' => fake()->sentence(),
        ];
    }
}
