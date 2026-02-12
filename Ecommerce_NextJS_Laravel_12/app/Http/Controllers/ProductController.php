<?php

namespace App\Http\Controllers;

use App\Models\Product;
use Illuminate\Http\Request;

class ProductController extends Controller
{
    /**
     * Get new arrival products
     */
    public function getNewArrivals(Request $request)
    {
        $limit = $request->query('limit', 10);
        
        $products = Product::where('is_new', true)
            ->orWhere('created_at', '>=', now()->subDays(30))
            ->with('images', 'category', 'brand')
            ->orderBy('created_at', 'desc')
            ->limit($limit)
            ->get();

        return response()->json($products);
    }

    /**
     * Get best seller products
     */
    public function getBestSellers(Request $request)
    {
        $limit = $request->query('limit', 10);
        
        // First try to get products marked as bestseller or with sales
        $products = Product::where('is_bestseller', true)
            ->orWhere('sales_count', '>', 0)
            ->with('images', 'category', 'brand')
            ->orderBy('sales_count', 'desc')
            ->orderBy('rating', 'desc')
            ->limit($limit)
            ->get();
        
        // If no bestsellers found, fallback to highest rated products
        if ($products->isEmpty()) {
            $products = Product::with('images', 'category', 'brand')
                ->where('status', 'active')
                ->orderBy('rating', 'desc')
                ->orderBy('review_count', 'desc')
                ->limit($limit)
                ->get();
        }

        return response()->json($products);
    }

    /**
     * Get featured products
     */
    public function getFeaturedProducts(Request $request)
    {
        $limit = $request->query('limit', 10);
        
        // First try to get featured products
        $products = Product::where('is_featured', true)
            ->with('images', 'category', 'brand')
            ->orderBy('display_order', 'asc')
            ->orderBy('rating', 'desc')
            ->limit($limit)
            ->get();
        
        // If no featured products, fallback to top rated products
        if ($products->isEmpty()) {
            $products = Product::with('images', 'category', 'brand')
                ->where('status', 'active')
                ->orderBy('rating', 'desc')
                ->orderBy('review_count', 'desc')
                ->limit($limit)
                ->get();
        }

        return response()->json($products);
    }

    /**
     * Get all products with optional filters
     */
    public function index(Request $request)
    {
        $query = Product::with('images', 'category', 'brand');

        // Filter by new arrivals
        if ($request->query('new') === 'true') {
            $query->where('is_new', true)
                ->orWhere('created_at', '>=', now()->subDays(30));
        }

        // Filter by bestsellers
        if ($request->query('bestseller') === 'true') {
            $query->where('is_bestseller', true)
                ->orWhere('sales_count', '>', 0);
        }

        // Filter by featured
        if ($request->query('featured') === 'true') {
            $query->where('is_featured', true);
        }

        // Search functionality
        if ($request->query('search')) {
            $search = $request->query('search');
            $query->where('name', 'like', "%$search%")
                ->orWhere('description', 'like', "%$search%");
        }

        // Price range filter
        if ($request->query('min_price') || $request->query('max_price')) {
            $minPrice = $request->query('min_price', 0);
            $maxPrice = $request->query('max_price', 999999);
            $query->whereBetween('base_price', [$minPrice, $maxPrice]);
        }

        // Rating filter
        if ($request->query('min_rating')) {
            $minRating = $request->query('min_rating');
            $query->where('rating', '>=', $minRating);
        }

        // Sorting
        $sortBy = $request->query('sort_by', 'created_at');
        $sortOrder = $request->query('sort_order', 'desc');

        match($sortBy) {
            'price_low' => $query->orderBy('base_price', 'asc'),
            'price_high' => $query->orderBy('base_price', 'desc'),
            'rating' => $query->orderBy('rating', 'desc')->orderBy('review_count', 'desc'),
            'trending' => $query->orderBy('sales_count', 'desc'),
            default => $query->orderBy('created_at', $sortOrder),
        };

        $limit = $request->query('limit', 20);
        $products = $query->paginate($limit);

        return response()->json($products);
    }

    /**
     * Get single product by ID
     */
    public function show($id)
    {
        $product = Product::with('images', 'category', 'brand', 'discounts')
            ->findOrFail($id);

        return response()->json($product);
    }
}
