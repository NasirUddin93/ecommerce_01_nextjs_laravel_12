<?php

namespace Database\Seeders;

use App\Models\Product;
use App\Models\Category;
use App\Models\Brand;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class ProductSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $categories = Category::all();
        $brands = Brand::all();

        if ($categories->isEmpty() || $brands->isEmpty()) {
            $this->command->info('Please run CategorySeeder and BrandSeeder first.');
            return;
        }

        $products = [
            // Electronics
            ['name' => 'iPhone 15 Pro Max', 'category' => 'Electronics', 'brand' => 'Apple', 'price' => 1199, 'stock' => 50, 'weight' => 0.221, 'description' => 'Latest iPhone with A17 Pro chip and titanium design'],
            ['name' => 'Samsung Galaxy S24 Ultra', 'category' => 'Mobile Phones', 'brand' => 'Samsung', 'price' => 1099, 'stock' => 45, 'weight' => 0.232, 'description' => 'Flagship Android phone with S Pen and AI features'],
            ['name' => 'MacBook Pro 16" M3', 'category' => 'Computers & Laptops', 'brand' => 'Apple', 'price' => 2499, 'stock' => 30, 'weight' => 2.1, 'description' => 'Professional laptop with M3 chip and stunning display'],
            ['name' => 'Dell XPS 15', 'category' => 'Computers & Laptops', 'brand' => 'Dell', 'price' => 1799, 'stock' => 25, 'weight' => 1.86, 'description' => 'Powerful laptop for creators and professionals'],
            ['name' => 'Sony WH-1000XM5', 'category' => 'Audio & Headphones', 'brand' => 'Sony', 'price' => 399, 'stock' => 100, 'weight' => 0.25, 'description' => 'Industry-leading noise cancelling headphones'],
            ['name' => 'Bose QuietComfort Ultra', 'category' => 'Audio & Headphones', 'brand' => 'Bose', 'price' => 429, 'stock' => 80, 'weight' => 0.254, 'description' => 'Premium wireless headphones with spatial audio'],
            ['name' => 'Canon EOS R5', 'category' => 'Cameras & Photography', 'brand' => 'Canon', 'price' => 3899, 'stock' => 15, 'weight' => 0.738, 'description' => 'Professional mirrorless camera with 8K video'],
            ['name' => 'Nikon Z9', 'category' => 'Cameras & Photography', 'brand' => 'Nikon', 'price' => 5499, 'stock' => 10, 'weight' => 1.34, 'description' => 'Flagship mirrorless camera for professionals'],
            ['name' => 'LG OLED TV 65"', 'category' => 'Electronics', 'brand' => 'LG', 'price' => 1999, 'stock' => 20, 'weight' => 22.5, 'description' => '4K OLED TV with stunning picture quality'],
            ['name' => 'Sony PlayStation 5', 'category' => 'Gaming', 'brand' => 'Sony', 'price' => 499, 'stock' => 60, 'weight' => 4.5, 'description' => 'Next-gen gaming console with ray tracing'],

            // Clothing & Fashion
            ['name' => 'Nike Air Max 270', 'category' => 'Sports & Outdoors', 'brand' => 'Nike', 'price' => 150, 'stock' => 200, 'weight' => 0.8, 'description' => 'Comfortable running shoes with Air cushioning'],
            ['name' => 'Adidas Ultraboost 22', 'category' => 'Sports & Outdoors', 'brand' => 'Adidas', 'price' => 180, 'stock' => 180, 'weight' => 0.85, 'description' => 'Premium running shoes with Boost technology'],
            ['name' => 'Zara Slim Fit Blazer', 'category' => 'Clothing & Fashion', 'brand' => 'Zara', 'price' => 129, 'stock' => 75, 'weight' => 0.6, 'description' => 'Elegant blazer for formal occasions'],
            ['name' => 'H&M Cotton T-Shirt Pack', 'category' => 'Clothing & Fashion', 'brand' => 'H&M', 'price' => 29.99, 'stock' => 300, 'weight' => 0.3, 'description' => 'Pack of 3 comfortable cotton t-shirts'],
            ['name' => 'Puma Track Jacket', 'category' => 'Sports & Outdoors', 'brand' => 'Puma', 'price' => 85, 'stock' => 120, 'weight' => 0.5, 'description' => 'Sporty jacket for casual and athletic wear'],

            // Home & Kitchen
            ['name' => 'Samsung Smart Refrigerator', 'category' => 'Home & Kitchen', 'brand' => 'Samsung', 'price' => 2299, 'stock' => 12, 'weight' => 120, 'description' => 'Smart fridge with touchscreen and AI'],
            ['name' => 'LG Washing Machine', 'category' => 'Home & Kitchen', 'brand' => 'LG', 'price' => 899, 'stock' => 18, 'weight' => 75, 'description' => 'Energy-efficient washing machine with AI DD'],
            ['name' => 'HP DeskJet Printer', 'category' => 'Computers & Laptops', 'brand' => 'HP', 'price' => 149, 'stock' => 85, 'weight' => 5.5, 'description' => 'All-in-one wireless printer for home and office'],

            // Audio
            ['name' => 'JBL Flip 6', 'category' => 'Audio & Headphones', 'brand' => 'JBL', 'price' => 129, 'stock' => 150, 'weight' => 0.55, 'description' => 'Portable Bluetooth speaker with powerful sound'],
            ['name' => 'Bose SoundLink Mini', 'category' => 'Audio & Headphones', 'brand' => 'Bose', 'price' => 199, 'stock' => 95, 'weight' => 0.67, 'description' => 'Compact wireless speaker with deep bass'],
        ];

        foreach ($products as $productData) {
            $category = $categories->firstWhere('name', $productData['category']);
            $brand = $brands->firstWhere('name', $productData['brand']);

            if (!$category) {
                $category = $categories->random();
            }
            if (!$brand) {
                $brand = $brands->random();
            }

            Product::create([
                'category_id' => $category->id,
                'brand_id' => $brand->id,
                'name' => $productData['name'],
                'sku' => strtoupper(substr(str_replace(' ', '-', $productData['name']), 0, 20)) . '-' . rand(1000, 9999),
                'description' => $productData['description'],
                'base_price' => $productData['price'],
                'stock_quantity' => $productData['stock'],
                'weight' => $productData['weight'],
                'is_seasonal' => false,
                'seasonal_start_date' => null,
                'seasonal_end_date' => null,
                'status' => 'active',
            ]);
        }
    }
}
