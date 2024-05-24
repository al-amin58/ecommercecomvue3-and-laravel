<?php

namespace Database\Seeders;

// use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use App\Models\Product;
use App\Models\Image;
use Hash;
class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     */
    public function run(): void
    {
        // \App\Models\User::factory(10)->create();

         \App\Models\User::factory()->create([
             'name' => 'Admin',
             'email' => 'admin@gmail.com',
             'password' => Hash::make('12345678'),
              'type' => '1',
         ]);
         \App\Models\User::factory()->create([
             'name' => 'User',
             'email' => 'user@gmail.com',
             'password' => Hash::make('12345678'),
         ]);

    //    Product::factory()->count(50)->create();
    //    Image::factory()->count(100)->create();

    }
}
