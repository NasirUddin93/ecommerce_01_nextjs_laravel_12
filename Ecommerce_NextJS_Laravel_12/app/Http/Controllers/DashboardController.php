<?php

namespace App\Http\Controllers;

use App\Models\Product;
use App\Models\Order;
use App\Models\User;
use App\Models\Payment;
use App\Models\Review;
use App\Models\InventoryLog;
use App\Models\OrderStatusHistory;
use App\Models\Notification;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class DashboardController extends Controller
{
    public function getStatistics()
    {
        try {
            $lowStockThreshold = 5;

            // Get counts
            $totalProducts = Product::count();
            $totalOrders = Order::count();
            $totalUsers = User::where('role', 'customer')->count();
            
            // Calculate revenue from payments
            $totalRevenue = Payment::where('status', 'success')->sum('amount');
            
            // Calculate growth rate (compare last 30 days vs previous 30 days)
            $currentMonthOrders = Order::where('created_at', '>=', now()->subDays(30))->count();
            $previousMonthOrders = Order::whereBetween('created_at', [
                now()->subDays(60),
                now()->subDays(30)
            ])->count();
            
            $growthRate = $previousMonthOrders > 0 
                ? round((($currentMonthOrders - $previousMonthOrders) / $previousMonthOrders) * 100, 1)
                : 0;

            // Business summary metrics (orders, revenue, users)
            $currentRevenue = Payment::where('status', 'success')
                ->where('created_at', '>=', now()->subDays(30))
                ->sum('amount');
            $previousRevenue = Payment::where('status', 'success')
                ->whereBetween('created_at', [now()->subDays(60), now()->subDays(30)])
                ->sum('amount');
            $revenueChange = $previousRevenue > 0
                ? round((($currentRevenue - $previousRevenue) / $previousRevenue) * 100, 1)
                : 0;

            $currentUsers = User::where('role', 'customer')
                ->where('created_at', '>=', now()->subDays(30))
                ->count();
            $previousUsers = User::where('role', 'customer')
                ->whereBetween('created_at', [now()->subDays(60), now()->subDays(30)])
                ->count();
            $usersChange = $previousUsers > 0
                ? round((($currentUsers - $previousUsers) / $previousUsers) * 100, 1)
                : 0;
            
            // Active sales (orders in pending/paid/shipped status)
            $activeSales = Order::whereIn('status', ['pending', 'paid', 'shipped'])->count();
            $pendingOrders = Order::where('status', 'pending')->count();
            
            // Recent orders with customer details
            $recentOrders = Order::with('user')
                ->latest()
                ->take(5)
                ->get()
                ->map(function ($order) {
                    return [
                        'id' => $order->id,
                        'order_number' => '#' . str_pad($order->id, 4, '0', STR_PAD_LEFT),
                        'customer_name' => $order->customer_name ?? $order->user->name ?? 'Guest',
                        'customer_email' => $order->customer_email ?? $order->user->email ?? 'N/A',
                        'total_amount' => $order->total_amount,
                        'status' => $order->status,
                        'created_at' => $order->created_at->format('Y-m-d H:i:s'),
                    ];
                });

            // Sales trend (last 14 days)
            $salesTrend = Order::select(
                DB::raw('DATE(created_at) as date'),
                DB::raw('COUNT(*) as orders_count'),
                DB::raw('SUM(total_amount) as total_sales')
            )
                ->where('created_at', '>=', now()->subDays(14))
                ->groupBy('date')
                ->orderBy('date', 'asc')
                ->get();

            // Top selling products (all time, top 5)
            $topProducts = DB::table('order_items')
                ->join('products', 'order_items.product_id', '=', 'products.id')
                ->select(
                    'products.id',
                    'products.name',
                    DB::raw('SUM(order_items.quantity) as total_sold'),
                    DB::raw('SUM(order_items.quantity * order_items.price_at_purchase) as total_revenue')
                )
                ->groupBy('products.id', 'products.name')
                ->orderBy('total_sold', 'desc')
                ->limit(5)
                ->get();

            // Low stock alerts
            $lowStockItems = Product::where('stock_quantity', '<=', $lowStockThreshold)
                ->orderBy('stock_quantity', 'asc')
                ->limit(5)
                ->get(['id', 'name', 'sku', 'stock_quantity']);
            $lowStockCount = Product::where('stock_quantity', '<=', $lowStockThreshold)->count();

            // Inventory summary
            $inStockCount = Product::where('stock_quantity', '>', 0)->count();
            $outOfStockCount = Product::where('stock_quantity', '<=', 0)->count();

            // Customer satisfaction
            $averageRating = Review::avg('rating');
            $totalReviews = Review::count();

            // Recent activities (inventory logs + order status history)
            $inventoryActivities = InventoryLog::with('product')
                ->latest()
                ->take(5)
                ->get()
                ->map(function ($log) {
                    return [
                        'type' => 'inventory',
                        'message' => ($log->product->name ?? 'Product') . ' inventory ' . $log->change_type . ' (' . $log->quantity_changed . ')',
                        'created_at' => optional($log->created_at)->format('Y-m-d H:i:s')
                    ];
                });

            $orderActivities = OrderStatusHistory::latest('created_at')
                ->take(5)
                ->get()
                ->map(function ($history) {
                    return [
                        'type' => 'order',
                        'message' => 'Order #' . $history->order_id . ' status: ' . ($history->new_status ?? 'updated'),
                        'created_at' => optional($history->created_at)->format('Y-m-d H:i:s')
                    ];
                });

            $recentActivities = collect($inventoryActivities)
                ->merge($orderActivities)
                ->sortByDesc('created_at')
                ->values()
                ->take(10);

            // Notifications panel
            $notifications = Notification::latest()
                ->take(5)
                ->get()
                ->map(function ($notification) {
                    return [
                        'id' => $notification->id,
                        'message' => $notification->message,
                        'status' => $notification->status,
                        'created_at' => optional($notification->created_at)->format('Y-m-d H:i:s')
                    ];
                });

            return response()->json([
                'data' => [
                    'total_products' => $totalProducts,
                    'total_orders' => $totalOrders,
                    'total_revenue' => round($totalRevenue, 2),
                    'total_users' => $totalUsers,
                    'growth_rate' => $growthRate,
                    'active_sales' => $activeSales,
                    'pending_orders' => $pendingOrders,
                    'recent_orders' => $recentOrders,
                    'sales_trend' => $salesTrend,
                    'top_products' => $topProducts,
                    'low_stock' => [
                        'threshold' => $lowStockThreshold,
                        'count' => $lowStockCount,
                        'items' => $lowStockItems,
                    ],
                    'business_summary' => [
                        'orders' => [
                            'current' => $currentMonthOrders,
                            'previous' => $previousMonthOrders,
                            'change' => $growthRate,
                        ],
                        'revenue' => [
                            'current' => round($currentRevenue, 2),
                            'previous' => round($previousRevenue, 2),
                            'change' => $revenueChange,
                        ],
                        'users' => [
                            'current' => $currentUsers,
                            'previous' => $previousUsers,
                            'change' => $usersChange,
                        ],
                    ],
                    'customer_satisfaction' => [
                        'average_rating' => round($averageRating ?? 0, 2),
                        'total_reviews' => $totalReviews,
                    ],
                    'inventory_status' => [
                        'total' => $totalProducts,
                        'in_stock' => $inStockCount,
                        'out_of_stock' => $outOfStockCount,
                        'low_stock' => $lowStockCount,
                    ],
                    'recent_activities' => $recentActivities,
                    'notifications' => $notifications,
                ],
                'status' => 200,
                'message' => 'Dashboard statistics retrieved successfully'
            ], 200);
        } catch (\Exception $e) {
            return response()->json([
                'status' => 500,
                'message' => 'Error fetching dashboard statistics: ' . $e->getMessage()
            ], 500);
        }
    }

    public function getReports(Request $request)
    {
        try {
            $startDate = $request->input('start_date', now()->subDays(30)->format('Y-m-d'));
            $endDate = $request->input('end_date', now()->format('Y-m-d'));

            // Sales trend (daily sales)
            $salesTrend = Order::select(
                DB::raw('DATE(created_at) as date'),
                DB::raw('COUNT(*) as orders_count'),
                DB::raw('SUM(total_amount) as total_sales')
            )
            ->whereBetween('created_at', [$startDate, $endDate])
            ->groupBy('date')
            ->orderBy('date', 'asc')
            ->get();

            // Top selling products
            $topProducts = DB::table('order_items')
                ->join('products', 'order_items.product_id', '=', 'products.id')
                ->select(
                    'products.id',
                    'products.name',
                    DB::raw('SUM(order_items.quantity) as total_sold'),
                    DB::raw('SUM(order_items.quantity * order_items.price_at_purchase) as total_revenue')
                )
                ->groupBy('products.id', 'products.name')
                ->orderBy('total_sold', 'desc')
                ->limit(10)
                ->get();

            // Revenue by payment method
            $revenueByMethod = Payment::select(
                'payment_method',
                DB::raw('COUNT(*) as count'),
                DB::raw('SUM(amount) as total')
            )
            ->where('status', 'success')
            ->whereBetween('created_at', [$startDate, $endDate])
            ->groupBy('payment_method')
            ->get();

            // Order status breakdown
            $ordersByStatus = Order::select(
                'status',
                DB::raw('COUNT(*) as count')
            )
            ->whereBetween('created_at', [$startDate, $endDate])
            ->groupBy('status')
            ->get();

            return response()->json([
                'data' => [
                    'sales_trend' => $salesTrend,
                    'top_products' => $topProducts,
                    'revenue_by_method' => $revenueByMethod,
                    'orders_by_status' => $ordersByStatus,
                    'date_range' => [
                        'start' => $startDate,
                        'end' => $endDate
                    ]
                ],
                'status' => 200,
                'message' => 'Reports data retrieved successfully'
            ], 200);
        } catch (\Exception $e) {
            return response()->json([
                'status' => 500,
                'message' => 'Error fetching reports: ' . $e->getMessage()
            ], 500);
        }
    }

    public function search(Request $request)
    {
        try {
            $query = trim($request->input('q', ''));
            if (strlen($query) < 2) {
                return response()->json([
                    'status' => 200,
                    'data' => [
                        'products' => [],
                        'orders' => [],
                        'users' => []
                    ]
                ], 200);
            }

            $products = Product::where('name', 'like', "%{$query}%")
                ->orWhere('sku', 'like', "%{$query}%")
                ->limit(5)
                ->get(['id', 'name', 'sku', 'stock_quantity']);

            $orders = Order::where('id', $query)
                ->orWhere('customer_name', 'like', "%{$query}%")
                ->orWhere('customer_email', 'like', "%{$query}%")
                ->limit(5)
                ->get(['id', 'customer_name', 'customer_email', 'total_amount', 'status', 'created_at']);

            $users = User::where('name', 'like', "%{$query}%")
                ->orWhere('email', 'like', "%{$query}%")
                ->limit(5)
                ->get(['id', 'name', 'email', 'role']);

            return response()->json([
                'status' => 200,
                'data' => [
                    'products' => $products,
                    'orders' => $orders,
                    'users' => $users
                ]
            ], 200);
        } catch (\Exception $e) {
            return response()->json([
                'status' => 500,
                'message' => 'Error searching dashboard: ' . $e->getMessage()
            ], 500);
        }
    }

    public function exportReports(Request $request)
    {
        try {
            $startDate = $request->input('start_date', now()->subDays(30)->format('Y-m-d'));
            $endDate = $request->input('end_date', now()->format('Y-m-d'));
            $format = strtolower($request->input('format', 'csv'));

            $salesTrend = Order::select(
                DB::raw('DATE(created_at) as date'),
                DB::raw('COUNT(*) as orders_count'),
                DB::raw('SUM(total_amount) as total_sales')
            )
                ->whereBetween('created_at', [$startDate, $endDate])
                ->groupBy('date')
                ->orderBy('date', 'asc')
                ->get();

            $topProducts = DB::table('order_items')
                ->join('products', 'order_items.product_id', '=', 'products.id')
                ->select(
                    'products.name',
                    DB::raw('SUM(order_items.quantity) as total_sold'),
                    DB::raw('SUM(order_items.quantity * order_items.price_at_purchase) as total_revenue')
                )
                ->groupBy('products.name')
                ->orderBy('total_sold', 'desc')
                ->limit(10)
                ->get();

            if ($format === 'pdf') {
                if (!class_exists('Barryvdh\\DomPDF\\Facade\\Pdf')) {
                    return response()->json([
                        'status' => 500,
                        'message' => 'PDF export is not available. Please install barryvdh/laravel-dompdf.'
                    ], 500);
                }

                $html = view('reports.export', [
                    'salesTrend' => $salesTrend,
                    'topProducts' => $topProducts,
                    'startDate' => $startDate,
                    'endDate' => $endDate,
                ])->render();

                $pdf = \Barryvdh\DomPDF\Facade\Pdf::loadHTML($html);
                return $pdf->download('reports.pdf');
            }

            $csv = "Sales Trend\nDate,Orders,Total Sales\n";
            foreach ($salesTrend as $row) {
                $csv .= "{$row->date},{$row->orders_count},{$row->total_sales}\n";
            }

            $csv .= "\nTop Products\nProduct,Total Sold,Total Revenue\n";
            foreach ($topProducts as $row) {
                $csv .= "{$row->name},{$row->total_sold},{$row->total_revenue}\n";
            }

            $filename = 'reports_' . $startDate . '_to_' . $endDate . '.csv';
            return response($csv, 200, [
                'Content-Type' => 'text/csv',
                'Content-Disposition' => "attachment; filename=\"{$filename}\"",
            ]);
        } catch (\Exception $e) {
            return response()->json([
                'status' => 500,
                'message' => 'Error exporting reports: ' . $e->getMessage()
            ], 500);
        }
    }
}
