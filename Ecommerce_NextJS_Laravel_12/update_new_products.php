<?php

require __DIR__.'/vendor/autoload.php';

$app = require_once __DIR__.'/bootstrap/app.php';
$app->make(\Illuminate\Contracts\Console\Kernel::class)->bootstrap();

use App\Models\Product;

// Update the latest 10 products to be marked as "new"
$latestProducts = Product::orderBy('created_at', 'desc')
    ->limit(10)
    ->update(['is_new' => true]);

echo "Updated {$latestProducts} products to be marked as new.\n";

// Also mark products created in the last 30 days as new
$recentProducts = Product::where('created_at', '>=', now()->subDays(30))
    ->update(['is_new' => true]);

echo "Marked {$recentProducts} products from last 30 days as new.\n";

// Show some sample new products
$newProducts = Product::where('is_new', true)
    ->limit(5)
    ->get(['id', 'name', 'is_new', 'created_at']);

echo "\nSample New Products:\n";
foreach ($newProducts as $product) {
    echo "ID: {$product->id} | Name: {$product->name} | Created: {$product->created_at}\n";
}
