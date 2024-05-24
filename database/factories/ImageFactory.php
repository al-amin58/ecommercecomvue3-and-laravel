<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;
use App\Models\Product;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Image>
 */
class ImageFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        return [
            'url'           => $this->faker->imageUrl(400, 200),
            'product_id'    => function(){return Product::inRandomOrder()->value('id');},
            'created_at'    => now(),
            'updated_at'    => now(),
        ];
    }
}
