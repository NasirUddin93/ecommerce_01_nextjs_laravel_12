<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;

class CategorySeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $categories = [
            ['name' => 'Electronics', 'status' => 1, 'description' => 'Latest electronic gadgets and devices'],
            ['name' => 'Clothing & Fashion', 'status' => 1, 'description' => 'Trendy clothes and fashion accessories'],
            ['name' => 'Sports & Outdoors', 'status' => 1, 'description' => 'Sports equipment and outdoor gear'],
            ['name' => 'Home & Kitchen', 'status' => 1, 'description' => 'Home appliances and kitchen essentials'],
            ['name' => 'Books & Media', 'status' => 1, 'description' => 'Books, movies, music, and games'],
            ['name' => 'Beauty & Health', 'status' => 1, 'description' => 'Beauty products and health supplements'],
            ['name' => 'Toys & Games', 'status' => 1, 'description' => 'Fun toys and board games for all ages'],
            ['name' => 'Automotive', 'status' => 1, 'description' => 'Car accessories and automotive parts'],
            ['name' => 'Jewelry & Watches', 'status' => 1, 'description' => 'Elegant jewelry and premium watches'],
            ['name' => 'Furniture', 'status' => 1, 'description' => 'Modern furniture for home and office'],
            ['name' => 'Computers & Laptops', 'status' => 1, 'description' => 'High-performance computers and laptops'],
            ['name' => 'Mobile Phones', 'status' => 1, 'description' => 'Latest smartphones and accessories'],
            ['name' => 'Cameras & Photography', 'status' => 1, 'description' => 'Professional cameras and photo equipment'],
            ['name' => 'Audio & Headphones', 'status' => 1, 'description' => 'Premium audio equipment and headphones'],
            ['name' => 'Gaming', 'status' => 1, 'description' => 'Gaming consoles, games, and accessories'],
        ];

        foreach ($categories as &$category) {
            $category['created_at'] = now();
            $category['updated_at'] = now();
        }

        DB::table('categories')->insert($categories);
    }
}
