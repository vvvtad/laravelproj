<?php

namespace Database\Factories;

use App\Models\MembershipApplication;
use App\Models\MembershipCategory;
use Illuminate\Database\Eloquent\Factories\Factory;
use Illuminate\Support\Str;

/**
 * @extends Factory<MembershipApplication>
 */
class MembershipApplicationFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        return [
            'membership_category_id' => MembershipCategory::factory(),
            'reference_no' => 'MEM-'.Str::upper(Str::random(10)),
            'full_name' => fake()->name(),
            'email' => fake()->unique()->safeEmail(),
            'phone' => fake()->phoneNumber(),
            'address' => fake()->address(),
            'latitude' => fake()->latitude(),
            'longitude' => fake()->longitude(),
            'status' => 'pending',
            'verification_sent_at' => null,
        ];
    }
}
