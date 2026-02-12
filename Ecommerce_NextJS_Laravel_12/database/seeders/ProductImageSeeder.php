<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\Product;
use App\Models\ProductImage;

class ProductImageSeeder extends Seeder
{
    public function run(): void
    {
        $products = Product::all();

        if ($products->isEmpty()) {
            $this->command->info('No products found. Please run ProductSeeder first.');
            return;
        }

        foreach ($products as $product) {
            // Create primary image
            ProductImage::create([
                'product_id' => $product->id,
                'image_url' => 'products/product-' . $product->id . '-main.jpg',
                'is_primary' => true,
            ]);

            // Create 2-4 additional images per product
            $additionalImages = rand(2, 4);
            for ($i = 2; $i <= $additionalImages; $i++) {
                ProductImage::create([
                    'product_id' => $product->id,
                    'image_url' => 'products/product-' . $product->id . '-' . $i . '.jpg',
                    'is_primary' => false,
                ]);
            }
        }
    }
}
