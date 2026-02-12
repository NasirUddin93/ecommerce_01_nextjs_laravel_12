<?php

namespace App\Services\Analytics;

use App\Models\Order;
use App\Models\Product;
use App\Models\User;
use App\Models\Payment;
use App\Models\Review;
use Illuminate\Support\Facades\DB;
use Carbon\Carbon;

/**
 * Advanced Analytics Service
 * 
 * Comprehensive analytics and reporting for e-commerce platform
 * Includes sales analysis, customer behavior, inventory insights, etc.
 */
class AnalyticsService
{
    /**
     * Get Sales Overview
     */
    public function getSalesOverview(string $period = 'monthly'): array
    {
        $query = Order::query();

        if ($period === 'daily') {
            $query->whereDate('created_at', today());
        } elseif ($period === 'weekly') {
            $query->whereBetween('created_at', [now()->startOfWeek(), now()->endOfWeek()]);
        } elseif ($period === 'monthly') {
            $query->whereYear('created_at', now()->year)
                ->whereMonth('created_at', now()->month);
        } elseif ($period === 'yearly') {
            $query->whereYear('created_at', now()->year);
        }

        return [
            'total_orders' => $query->count(),
            'total_revenue' => $query->sum('total_amount'),
            'average_order_value' => $query->avg('total_amount'),
            'completed_orders' => $query->where('status', 'delivered')->count(),
            'pending_orders' => $query->where('status', 'pending')->count(),
            'cancelled_orders' => $query->where('status', 'cancelled')->count(),
        ];
    }

    /**
     * Get Revenue Trends
     */
    public function getRevenueTrends(int $days = 30): array
    {
        $data = Order::query()
            ->select(
                DB::raw('DATE(created_at) as date'),
                DB::raw('COUNT(*) as orders'),
                DB::raw('SUM(total_amount) as revenue'),
                DB::raw('AVG(total_amount) as avg_order_value')
            )
            ->whereBetween('created_at', [now()->subDays($days), now()])
            ->where('status', 'delivered')
            ->groupBy('date')
            ->orderBy('date')
            ->get();

        return $data->toArray();
    }

    /**
     * Get Top Products
     */
    public function getTopProducts(int $limit = 10): array
    {
        return DB::table('order_items')
            ->join('products', 'order_items.product_id', '=', 'products.id')
            ->select(
                'products.id',
                'products.name',
                'products.base_price',
                DB::raw('COUNT(order_items.id) as total_sold'),
                DB::raw('SUM(order_items.quantity) as quantity_sold'),
                DB::raw('SUM(order_items.quantity * order_items.price_at_purchase) as revenue'),
                'products.rating'
            )
            ->groupBy('products.id', 'products.name', 'products.base_price', 'products.rating')
            ->orderByDesc('revenue')
            ->limit($limit)
            ->get()
            ->toArray();
    }

    /**
     * Get Customer Insights
     */
    public function getCustomerInsights(): array
    {
        return [
            'total_customers' => User::where('role', 'customer')->count(),
            'new_customers_this_month' => User::where('role', 'customer')
                ->whereYear('created_at', now()->year)
                ->whereMonth('created_at', now()->month)
                ->count(),
            'repeat_customers' => User::where('role', 'customer')
                ->whereHas('orders', function ($query) {
                    $query->select('user_id')
                        ->groupBy('user_id')
                        ->havingRaw('COUNT(*) > 1');
                })
                ->count(),
            'average_customer_lifetime_value' => DB::table('users')
                ->join('orders', 'users.id', '=', 'orders.user_id')
                ->where('users.role', 'customer')
                ->select(DB::raw('AVG(total_amount) as avg_value'))
                ->first()?->avg_value ?? 0,
        ];
    }

    /**
     * Get Product Performance
     */
    public function getProductPerformance(): array
    {
        return [
            'total_products' => Product::count(),
            'active_products' => Product::where('status', 'active')->count(),
            'low_stock_products' => Product::where('stock_quantity', '<', 10)->count(),
            'average_rating' => Product::avg('rating'),
            'products_with_reviews' => Product::whereHas('reviews')->count(),
        ];
    }

    /**
     * Get Category Performance
     */
    public function getCategoryPerformance(): array
    {
        return DB::table('categories')
            ->leftJoin('products', 'categories.id', '=', 'products.category_id')
            ->leftJoin('order_items', 'products.id', '=', 'order_items.product_id')
            ->select(
                'categories.id',
                'categories.name',
                DB::raw('COUNT(DISTINCT products.id) as total_products'),
                DB::raw('SUM(order_items.quantity) as total_sold'),
                DB::raw('SUM(order_items.quantity * order_items.price_at_purchase) as revenue')
            )
            ->groupBy('categories.id', 'categories.name')
            ->orderByDesc('revenue')
            ->get()
            ->toArray();
    }

    /**
     * Get Payment Method Analysis
     */
    public function getPaymentMethodAnalysis(): array
    {
        return DB::table('orders')
            ->select(
                'payment_method',
                DB::raw('COUNT(*) as total_orders'),
                DB::raw('SUM(total_amount) as total_revenue'),
                DB::raw('AVG(total_amount) as avg_order_value'),
                DB::raw('COUNT(CASE WHEN status = "delivered" THEN 1 END) as successful_orders')
            )
            ->groupBy('payment_method')
            ->get()
            ->toArray();
    }

    /**
     * Get Conversion Funnel
     */
    public function getConversionFunnel(): array
    {
        $period = now()->subDays(30);

        return [
            'visitors' => 0, // Would need analytics tracking
            'product_views' => 0, // Would need tracking
            'add_to_cart' => 0, // Would need tracking
            'checkout_started' => Order::whereBetween('created_at', [$period, now()])->count(),
            'orders_completed' => Order::where('status', 'delivered')
                ->whereBetween('created_at', [$period, now()])
                ->count(),
        ];
    }

    /**
     * Get Customer Retention
     */
    public function getCustomerRetention(): array
    {
        $thisMonth = User::where('role', 'customer')
            ->whereYear('created_at', now()->year)
            ->whereMonth('created_at', now()->month)
            ->count();

        $lastMonth = User::where('role', 'customer')
            ->whereYear('created_at', now()->subMonth()->year)
            ->whereMonth('created_at', now()->subMonth()->month)
            ->count();

        $repeating = User::where('role', 'customer')
            ->whereHas('orders', function ($query) {
                $query->where('created_at', '>=', now()->subMonth());
            })
            ->count();

        return [
            'new_customers_this_month' => $thisMonth,
            'returning_customers' => $repeating,
            'retention_rate' => $lastMonth > 0 ? ($repeating / $lastMonth) * 100 : 0,
        ];
    }

    /**
     * Get Inventory Insights
     */
    public function getInventoryInsights(): array
    {
        return [
            'total_stock_value' => DB::table('products')
                ->select(DB::raw('SUM(stock_quantity * base_price) as total_value'))
                ->first()?->total_value ?? 0,
            'low_stock_count' => Product::where('stock_quantity', '<', 10)->count(),
            'out_of_stock_count' => Product::where('stock_quantity', 0)->count(),
            'average_stock_per_product' => Product::avg('stock_quantity'),
            'fast_moving_products' => $this->getFastMovingProducts(5),
            'slow_moving_products' => $this->getSlowMovingProducts(5),
        ];
    }

    /**
     * Get Fast Moving Products
     */
    private function getFastMovingProducts(int $limit = 5): array
    {
        return DB::table('order_items')
            ->join('products', 'order_items.product_id', '=', 'products.id')
            ->select(
                'products.id',
                'products.name',
                DB::raw('SUM(order_items.quantity) as total_sold')
            )
            ->whereBetween('order_items.created_at', [now()->subDays(30), now()])
            ->groupBy('products.id', 'products.name')
            ->orderByDesc('total_sold')
            ->limit($limit)
            ->get()
            ->toArray();
    }

    /**
     * Get Slow Moving Products
     */
    private function getSlowMovingProducts(int $limit = 5): array
    {
        return Product::where('status', 'active')
            ->where('stock_quantity', '>', 0)
            ->leftJoin('order_items', 'products.id', '=', 'order_items.product_id')
            ->select('products.id', 'products.name', 'products.stock_quantity', DB::raw('COUNT(order_items.id) as total_sold'))
            ->whereNotNull('order_items.id')
            ->whereBetween('order_items.created_at', [now()->subDays(90), now()])
            ->groupBy('products.id', 'products.name', 'products.stock_quantity')
            ->having(DB::raw('COUNT(order_items.id)'), '<', 5)
            ->limit($limit)
            ->get()
            ->toArray();
    }

    /**
     * Get Customer Segments
     */
    public function getCustomerSegments(): array
    {
        return [
            'high_value_customers' => User::where('role', 'customer')
                ->whereHas('orders', function ($query) {
                    $query->select('user_id')
                        ->selectRaw('SUM(total_amount) as total_spent')
                        ->groupBy('user_id')
                        ->havingRaw('SUM(total_amount) > 50000');
                })
                ->count(),
            'regular_customers' => User::where('role', 'customer')
                ->whereHas('orders', function ($query) {
                    $query->select('user_id')
                        ->selectRaw('SUM(total_amount) as total_spent')
                        ->groupBy('user_id')
                        ->havingRaw('SUM(total_amount) BETWEEN 10000 AND 50000');
                })
                ->count(),
            'one_time_buyers' => User::where('role', 'customer')
                ->whereHas('orders', function ($query) {
                    $query->select('user_id')
                        ->groupBy('user_id')
                        ->havingRaw('COUNT(*) = 1');
                })
                ->count(),
            'inactive_customers' => User::where('role', 'customer')
                ->whereDoesntHave('orders')
                ->count(),
        ];
    }

    /**
     * Get Review Insights
     */
    public function getReviewInsights(): array
    {
        return [
            'total_reviews' => Review::count(),
            'average_rating' => Review::avg('rating'),
            'five_star_reviews' => Review::where('rating', 5)->count(),
            'one_star_reviews' => Review::where('rating', 1)->count(),
            'products_with_reviews' => Review::select('product_id')->distinct()->count(),
        ];
    }

    /**
     * Generate Comprehensive Report
     */
    public function generateComprehensiveReport(): array
    {
        return [
            'period' => now()->format('Y-m-d'),
            'sales' => $this->getSalesOverview('monthly'),
            'revenue_trends' => $this->getRevenueTrends(30),
            'top_products' => $this->getTopProducts(10),
            'customer_insights' => $this->getCustomerInsights(),
            'product_performance' => $this->getProductPerformance(),
            'category_performance' => $this->getCategoryPerformance(),
            'payment_methods' => $this->getPaymentMethodAnalysis(),
            'customer_segments' => $this->getCustomerSegments(),
            'inventory' => $this->getInventoryInsights(),
            'reviews' => $this->getReviewInsights(),
        ];
    }
}
