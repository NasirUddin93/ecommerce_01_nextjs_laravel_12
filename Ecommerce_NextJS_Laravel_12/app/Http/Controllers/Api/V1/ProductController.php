<?php

namespace App\Http\Controllers\Api\V1;

use App\Models\Product;
use Illuminate\Http\Request;

class ProductController extends ApiController
{
    public function index(Request $request)
    {
        $query = Product::with('images', 'category', 'brand');

        if ($request->query('new') === 'true') {
            $query->where('is_new', true)
                ->orWhere('created_at', '>=', now()->subDays(30));
        }

        if ($request->query('bestseller') === 'true') {
            $query->where('is_bestseller', true)
                ->orWhere('sales_count', '>', 0);
        }

        if ($request->query('featured') === 'true') {
            $query->where('is_featured', true);
        }

        if ($request->query('search')) {
            $search = $request->query('search');
            $query->where('name', 'like', "%{$search}%")
                ->orWhere('description', 'like', "%{$search}%");
        }

        if ($request->query('min_price') || $request->query('max_price')) {
            $minPrice = $request->query('min_price', 0);
            $maxPrice = $request->query('max_price', 999999);
            $query->whereBetween('base_price', [$minPrice, $maxPrice]);
        }

        if ($request->query('min_rating')) {
            $query->where('rating', '>=', $request->query('min_rating'));
        }

        $sortBy = $request->query('sort_by', 'created_at');
        $sortOrder = $request->query('sort_order', 'desc');

        match ($sortBy) {
            'price_low' => $query->orderBy('base_price', 'asc'),
            'price_high' => $query->orderBy('base_price', 'desc'),
            'rating' => $query->orderBy('rating', 'desc')->orderBy('review_count', 'desc'),
            'trending' => $query->orderBy('sales_count', 'desc'),
            default => $query->orderBy('created_at', $sortOrder),
        };

        $perPage = min((int) $request->query('per_page', 20), 100);
        $products = $query->paginate($perPage);

        return $this->paginated($products, 'Products retrieved');
    }

    public function show($id)
    {
        $product = Product::with('images', 'category', 'brand', 'discounts')
            ->findOrFail($id);

        return $this->success($product, 'Product retrieved');
    }

    public function newArrivals(Request $request)
    {
        $perPage = min((int) $request->query('per_page', 10), 100);
        $products = Product::where('is_new', true)
            ->orWhere('created_at', '>=', now()->subDays(30))
            ->with('images', 'category', 'brand')
            ->orderBy('created_at', 'desc')
            ->paginate($perPage);

        return $this->paginated($products, 'New arrivals retrieved');
    }

    public function bestSellers(Request $request)
    {
        $perPage = min((int) $request->query('per_page', 10), 100);
        $products = Product::where('is_bestseller', true)
            ->orWhere('sales_count', '>', 0)
            ->with('images', 'category', 'brand')
            ->orderBy('sales_count', 'desc')
            ->orderBy('rating', 'desc')
            ->paginate($perPage);

        return $this->paginated($products, 'Best sellers retrieved');
    }

    public function featured(Request $request)
    {
        $perPage = min((int) $request->query('per_page', 10), 100);
        $products = Product::where('is_featured', true)
            ->with('images', 'category', 'brand')
            ->orderBy('display_order', 'asc')
            ->orderBy('rating', 'desc')
            ->paginate($perPage);

        return $this->paginated($products, 'Featured products retrieved');
    }

    /**
     * Search product by barcode
     * Supports both barcode and SKU search
     */
    public function searchByBarcode(Request $request)
    {
        $request->validate([
            'barcode' => 'required|string|min:1|max:100',
        ]);

        $barcode = trim($request->query('barcode'));

        // Search by barcode first, then by SKU as fallback
        $product = Product::with('images', 'category', 'brand', 'discounts')
            ->where('barcode', $barcode)
            ->orWhere('sku', $barcode)
            ->first();

        if (!$product) {
            return $this->error('Product not found', 404);
        }

        return $this->success($product, 'Product found');
    }
}
