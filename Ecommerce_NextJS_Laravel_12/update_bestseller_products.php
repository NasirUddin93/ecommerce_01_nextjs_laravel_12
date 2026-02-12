<?php

require __DIR__.'/vendor/autoload.php';

$app = require_once __DIR__.'/bootstrap/app.php';
$app->make(\Illuminate\Contracts\Console\Kernel::class)->bootstrap();

use App\Models\Product;

// Mark top 10 products as bestsellers and give them sales counts
$products = Product::inRandomOrder()
    ->limit(10)
    ->get();

foreach ($products as $product) {
    $product->is_bestseller = true;
    $product->sales_count = rand(50, 500); // Random sales count between 50-500
    $product->save();
}

echo "Updated " . count($products) . " products to be marked as bestsellers.\n";

// Show sample bestseller products
$bestSellers = Product::where('is_bestseller', true)
    ->orderBy('sales_count', 'desc')
    ->limit(5)
    ->get(['id', 'name', 'is_bestseller', 'sales_count']);

echo "\nSample Best Seller Products:\n";
foreach ($bestSellers as $product) {
    echo "ID: {$product->id} | Name: {$product->name} | Sales: {$product->sales_count}\n";
}
