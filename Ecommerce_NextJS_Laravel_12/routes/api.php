<?php

use App\Http\Controllers\admin\AuthController;
use App\Http\Controllers\admin\BrandController;
use App\Http\Controllers\admin\CategoryController;
use App\Http\Controllers\admin\CouponController;
use App\Http\Controllers\admin\InventoryLogController;
use App\Http\Controllers\admin\OrderItemController;
use App\Http\Controllers\admin\SizeController;
use App\Http\Controllers\admin\ShippingController;
use App\Http\Controllers\admin\ProductController;
use App\Http\Controllers\admin\ProductVariantController;
use App\Http\Controllers\admin\ReviewController;
use App\Http\Controllers\admin\UserController;
use App\Http\Controllers\admin\WishlistController as AdminWishlistController;
use App\Http\Controllers\WishlistController;
use App\Http\Controllers\CouponUsageController;
use App\Http\Controllers\DiscountController;
use App\Http\Controllers\NotificationController;
use App\Http\Controllers\OrderShippingController;
use App\Http\Controllers\PaymentController;
use App\Http\Controllers\ShippingMethodController;
use App\Http\Controllers\TransactionController;
use App\Http\Controllers\DeliveryZoneController;
use App\Http\Controllers\BangladeshLocationController;
use App\Http\Controllers\CustomerAddressController;
use App\Http\Controllers\OrderStatusHistoryController;
use App\Http\Controllers\NewsletterController;
use App\Http\Controllers\SettingsController;
use App\Http\Controllers\DashboardController;
use App\Http\Controllers\ProductController as PublicProductController;
use App\Http\Controllers\OrderController as PublicOrderController;
use App\Http\Controllers\Api\V1\AuthController as MobileAuthController;
use App\Http\Controllers\Api\V1\BrandController as MobileBrandController;
use App\Http\Controllers\Api\V1\CategoryController as MobileCategoryController;
use App\Http\Controllers\Api\V1\ProductController as MobileProductController;
use App\Http\Controllers\Api\V1\BangladeshLocationController as MobileBangladeshLocationController;
use App\Http\Controllers\Api\V1\OrderController as MobileOrderController;
use App\Http\Controllers\Api\V1\DeviceTokenController as MobileDeviceTokenController;
use App\Http\Controllers\Api\V1\MediaController as MobileMediaController;
use App\Http\Controllers\Api\V1\PaymentController as MobilePaymentController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Admin\OrderController;
use App\Http\Controllers\AuthController as CustomerAuthController;




// Route::get('/user', function (Request $request) {
//     return $request->user();
// })->middleware('auth:sanctum');

// Admin Authentication Login
Route::post('/admin/login', [AuthController::class, 'authenticate']);
// Customer Authentication & OAuth Routes
Route::post('/auth/register', [CustomerAuthController::class, 'register']);
Route::post('/auth/login', [CustomerAuthController::class, 'login']);
Route::post('/auth/logout', [CustomerAuthController::class, 'logout'])->middleware('auth:sanctum');

// User Profile Routes (Customer authenticated)
Route::middleware('auth:sanctum')->group(function () {
    Route::get('/user/profile', [App\Http\Controllers\UserProfileController::class, 'profile']);
    Route::put('/user/profile', [App\Http\Controllers\UserProfileController::class, 'updateProfile']);
    Route::post('/user/change-password', [App\Http\Controllers\UserProfileController::class, 'changePassword']);
    Route::get('/user/notification-preferences', [App\Http\Controllers\UserProfileController::class, 'getNotificationPreferences']);
    Route::put('/user/notification-preferences', [App\Http\Controllers\UserProfileController::class, 'updateNotificationPreferences']);
    
    // Two-Factor Authentication
    Route::post('/user/2fa/enable', [App\Http\Controllers\UserProfileController::class, 'enable2FA']);
    Route::post('/user/2fa/disable', [App\Http\Controllers\UserProfileController::class, 'disable2FA']);
    Route::post('/user/2fa/verify', [App\Http\Controllers\UserProfileController::class, 'verify2FA']);
    
    // Active Sessions
    Route::get('/user/sessions', [App\Http\Controllers\UserProfileController::class, 'getActiveSessions']);
    Route::delete('/user/sessions/{id}', [App\Http\Controllers\UserProfileController::class, 'revokeSession']);
    Route::post('/user/sessions/revoke-all', [App\Http\Controllers\UserProfileController::class, 'revokeAllOtherSessions']);
    
    // Payment Methods
    Route::get('/user/payment-methods', [App\Http\Controllers\PaymentMethodController::class, 'index']);
    Route::post('/user/payment-methods', [App\Http\Controllers\PaymentMethodController::class, 'store']);
    Route::delete('/user/payment-methods/{id}', [App\Http\Controllers\PaymentMethodController::class, 'destroy']);
    Route::post('/user/payment-methods/{id}/set-default', [App\Http\Controllers\PaymentMethodController::class, 'setDefault']);

    // Customer wishlist
    Route::get('/wishlist', [WishlistController::class, 'index']);
    Route::post('/wishlist', [WishlistController::class, 'store']);
    Route::delete('/wishlist/{productId}', [WishlistController::class, 'destroy']);
});

// OAuth Routes
Route::get('/auth/google', [CustomerAuthController::class, 'googleRedirect']);
Route::get('/auth/google/callback', [CustomerAuthController::class, 'googleCallback']);

Route::get('/auth/facebook', [CustomerAuthController::class, 'facebookRedirect']);
Route::get('/auth/facebook/callback', [CustomerAuthController::class, 'facebookCallback']);

Route::get('/auth/github', [CustomerAuthController::class, 'githubRedirect']);
Route::get('/auth/github/callback', [CustomerAuthController::class, 'githubCallback']);
// � Mobile API v1
Route::prefix('v1')->group(function () {
    // Public mobile endpoints
    Route::post('/auth/register', [MobileAuthController::class, 'register']);
    Route::post('/auth/login', [MobileAuthController::class, 'login']);

    Route::get('/brands', [MobileBrandController::class, 'index']);
    Route::get('/brands/{id}', [MobileBrandController::class, 'show']);
    Route::get('/categories', [MobileCategoryController::class, 'index']);
    Route::get('/categories/{id}', [MobileCategoryController::class, 'show']);

    Route::get('/products', [MobileProductController::class, 'index']);
    Route::get('/products/{id}', [MobileProductController::class, 'show']);
    Route::get('/products/new-arrivals', [MobileProductController::class, 'newArrivals']);
    Route::get('/products/best-sellers', [MobileProductController::class, 'bestSellers']);
    Route::get('/products/featured', [MobileProductController::class, 'featured']);
    Route::get('/products/search/barcode', [MobileProductController::class, 'searchByBarcode']);

    Route::get('/bangladesh/divisions', [MobileBangladeshLocationController::class, 'divisions']);
    Route::get('/bangladesh/districts', [MobileBangladeshLocationController::class, 'districts']);
    Route::get('/bangladesh/areas', [MobileBangladeshLocationController::class, 'areas']);

    // Authenticated mobile endpoints
    Route::middleware('auth:sanctum')->group(function () {
        Route::get('/auth/me', [MobileAuthController::class, 'me']);
        Route::post('/auth/logout', [MobileAuthController::class, 'logout']);

        Route::get('/orders', [MobileOrderController::class, 'index']);
        Route::get('/orders/{id}', [MobileOrderController::class, 'show']);
        Route::post('/orders', [MobileOrderController::class, 'store']);
        Route::post('/orders/{id}/cancel', [MobileOrderController::class, 'cancel']);

        Route::post('/device-tokens/register', [MobileDeviceTokenController::class, 'register']);
        Route::post('/device-tokens/unregister', [MobileDeviceTokenController::class, 'unregister']);

        Route::post('/media/profile-image', [MobileMediaController::class, 'uploadProfileImage']);
        Route::post('/media/products/{productId}/image', [MobileMediaController::class, 'uploadProductImage']);

        Route::post('/payments/initialize', [MobilePaymentController::class, 'initialize']);
    });
});

// �🔓 PUBLIC ROUTES - No authentication required
// These endpoints are accessible to frontend customers and public visitors
Route::get('/categories', [CategoryController::class, 'index']);
Route::get('/categories/{id}', [CategoryController::class, 'show']);
Route::get('/brands', [BrandController::class, 'index']);
Route::get('/brands/{id}', [BrandController::class, 'show']);

// Public Product Feature Routes - MUST come BEFORE /products/{id}
Route::get('/products/new-arrivals', [PublicProductController::class, 'getNewArrivals']);
Route::get('/products/best-sellers', [PublicProductController::class, 'getBestSellers']);
Route::get('/products/featured', [PublicProductController::class, 'getFeaturedProducts']);

// General product routes
Route::get('/products', [ProductController::class, 'index']);
Route::get('/products/{id}', [ProductController::class, 'show']);
Route::get('/products/search', [ProductController::class, 'search']);
Route::get('/sale-products', [ProductController::class, 'getSaleProducts']);

Route::get('/sizes', [SizeController::class, 'index']);
Route::get('/sizes/{id}', [SizeController::class, 'show']);
Route::get('/reviews', [ReviewController::class, 'index']);
Route::get('/reviews/{id}', [ReviewController::class, 'show']);

// Public Bangladesh Location Routes (No authentication required)
Route::get('/bangladeshi-divisions', [BangladeshLocationController::class, 'getDivisions']);
Route::get('/bangladeshi-districts', [BangladeshLocationController::class, 'getDistricts']);
Route::get('/bangladeshi-areas', [BangladeshLocationController::class, 'getAreas']);
Route::get('/bangladeshi-divisions/{id}', [BangladeshLocationController::class, 'showDivision']);
Route::get('/bangladeshi-districts/{id}', [BangladeshLocationController::class, 'showDistrict']);
Route::get('/bangladeshi-areas/{id}', [BangladeshLocationController::class, 'showArea']);

// Newsletter subscription - public route
Route::post('/newsletter/subscribe', [NewsletterController::class, 'subscribe']);
Route::post('/newsletter/unsubscribe', [NewsletterController::class, 'unsubscribe']);

// Public Order Routes - for customers (prefix 'customer-orders' to avoid admin conflict)
Route::post('/customer-orders', [PublicOrderController::class, 'store']); // Create order
Route::get('/customer-orders', [PublicOrderController::class, 'index']); // Get customer orders by email
Route::get('/customer-orders/{id}', [PublicOrderController::class, 'show']); // Get single order
Route::post('/customer-orders/{id}/cancel', [PublicOrderController::class, 'cancel']); // Cancel order

Route::group(['middleware' => ['auth:sanctum']], function () {

    // Users Management
    Route::get('/users', [UserController::class, 'index']);
    Route::post('/users', [UserController::class, 'store']);
    Route::get('/users/{id}', [UserController::class, 'show']);
    Route::put('/users/{id}', [UserController::class, 'update']);
    Route::delete('/users/{id}', [UserController::class, 'destroy']);

    // Dashboard & Reports
    Route::get('/dashboard/statistics', [DashboardController::class, 'getStatistics']);
    Route::get('/dashboard/reports', [DashboardController::class, 'getReports']);
    Route::get('/dashboard/search', [DashboardController::class, 'search']);
    Route::get('/dashboard/reports/export', [DashboardController::class, 'exportReports']);

    // Settings
    Route::get('/settings', [SettingsController::class, 'index']);
    Route::post('/settings', [SettingsController::class, 'update']);
    Route::get('/settings/history', [SettingsController::class, 'history']);

    // Admin Brand Routes
    Route::post('/brands', [BrandController::class, 'store']);
    Route::put('/brands/{id}', [BrandController::class, 'update']);

    // Admin Category Routes
    Route::post('/categories/', [CategoryController::class, 'store']);
    Route::put('/categories/{id}', [CategoryController::class, 'update']);

    // Admin Sizes Routes
    Route::post('/sizes/', [SizeController::class, 'store']);
    Route::put('/sizes/{id}', [SizeController::class, 'update']);

    // Admin Shipping Routes
    Route::post('/shippings/store', [ShippingController::class, 'store']);
    Route::get('/shippings', [ShippingController::class, 'index']);
    Route::get('/shippings/{id}', [ShippingController::class, 'show']);
    Route::put('/shippings/{id}', [ShippingController::class, 'update']);

    // Admin Product Routes
    Route::prefix('products')->group(function () {
        Route::post('/', [ProductController::class, 'store']);
        Route::put('/{id}', [ProductController::class, 'update']);
        Route::post('/{id}', [ProductController::class, 'update']); // Allow POST for file uploads
        Route::delete('/{id}', [ProductController::class, 'destroy']);
        Route::post('/restore/{id}', [ProductController::class, 'restore']);
        Route::delete('/force-delete/{id}', [ProductController::class, 'forceDelete']);
    });
    //Product variants
    // Route::prefix('admin')->group(function () {
        Route::get('/product-variants', [ProductVariantController::class, 'index']);
        Route::post('/product-variants', [ProductVariantController::class, 'store']);
        Route::get('/product-variants/{id}', [ProductVariantController::class, 'show']);
        Route::put('/product-variants/{id}', [ProductVariantController::class, 'update']);
        Route::delete('/product-variants/{id}', [ProductVariantController::class, 'destroy']);
    // });

    // Route::prefix('admin')->group(function () {
        Route::get('/wishlists', [AdminWishlistController::class, 'index']);
        Route::post('/wishlists', [AdminWishlistController::class, 'store']);
        Route::get('/wishlists/{id}', [AdminWishlistController::class, 'show']);
        Route::delete('/wishlists/{id}', [AdminWishlistController::class, 'destroy']);
    // });

    // Admin Order Routes
    Route::prefix('orders')->group(function () {
        Route::get('/', [OrderController::class, 'index']);
        Route::get('/{id}', [OrderController::class, 'show']);
        Route::post('/', [OrderController::class, 'store']);
        Route::put('/{id}', [OrderController::class, 'update']);
        Route::delete('/{id}', [OrderController::class, 'destroy']);
        Route::post('/restore/{id}', [OrderController::class, 'restore']);
        Route::delete('/force-delete/{id}', [OrderController::class, 'forceDelete']);
    });

        // order items
        Route::get('/order-items', [OrderItemController::class, 'index']);
        Route::post('/order-items', [OrderItemController::class, 'store']);
        Route::get('order-items/trashed', [OrderItemController::class, 'trashed']);
        Route::get('order-items/trashed', [OrderItemController::class, 'trashed']);
        Route::post('order-items/{id}/restore', [OrderItemController::class, 'restore']);
        Route::delete('order-items/{id}/force-delete', [OrderItemController::class, 'forceDelete']);

        // Reviews
        Route::get('/reviews',[ReviewController::class,'index']);
        Route::post('/reviews',[ReviewController::class,'store']);
        Route::get('/reviews/{id}',[ReviewController::class,'show']);
        Route::put('/reviews/{id}',[ReviewController::class,'update']);
        Route::delete('/reviews/{id}',[ReviewController::class,'destroy']); 



        // Inventory Log
        Route::get('/inventory-log',[InventoryLogController::class,'index']);
        Route::post('/inventory-log',[InventoryLogController::class,'store']);
        Route::get('/inventory-log/{id}',[InventoryLogController::class,'show']);
        Route::put('/inventory-log/{id}',[InventoryLogController::class,'update']);
        Route::delete('/inventory-log/{id}',[InventoryLogController::class,'destroy']); 



        // Discounts
        Route::get('/discounts',[DiscountController::class,'index']);
        Route::post('/discounts',[DiscountController::class,'store']);
        Route::get('/discounts/{id}',[DiscountController::class,'show']);
        Route::put('/discounts/{id}',[DiscountController::class,'update']);
        Route::delete('/discounts/{id}',[DiscountController::class,'destroy']);

        // Notifications
        Route::get('/notifications',[NotificationController::class,'index']);
        Route::post('/notifications',[NotificationController::class,'store']);
        Route::get('/notifications/{id}',[NotificationController::class,'show']);
        Route::put('/notifications/{id}',[NotificationController::class,'update']);
        Route::delete('/notifications/{id}',[NotificationController::class,'destroy']);

        // Shipping Methods
        Route::get('/shipping-methods',[ShippingMethodController::class,'index']);
        Route::post('/shipping-methods',[ShippingMethodController::class,'store']);

        // Coupons
        Route::get('/coupons',[CouponController::class,'index']);
        Route::post('/coupons',[CouponController::class,'store']);
        // Route::get('/coupons/{id}',[CouponController::class,'show']);
        Route::put('/coupons/{id}',[CouponController::class,'update']);
        Route::delete('/coupons/{id}',[CouponController::class,'destroy']);

        // Coupon Usages    

        Route::get('/coupon-usages',[CouponUsageController::class,'index']);
        Route::post('/coupon-usages',[CouponUsageController::class,'store']);

        // Order Shippings  
        Route::get('/order-shippings',[OrderShippingController::class,'index']);
        Route::post('/order-shippings',[OrderShippingController::class,'store']);
        Route::get('/order-shippings/{id}',[OrderShippingController::class,'show']);
        Route::put('/order-shippings/{id}',[OrderShippingController::class,'update']);
        Route::delete('/order-shippings/{id}',[OrderShippingController::class,'destroy']);  

        // Transactions
        Route::get('/transactions',[TransactionController::class,'index']);

        // Payments Routes  
        Route::get('/payments',[PaymentController::class,'index']);
        Route::post('/payments',[PaymentController::class,'store']);
        Route::get('/payments/{id}',[PaymentController::class,'show']);
        Route::put('/payments/{id}',[PaymentController::class,'update']);
        Route::delete('/payments/{id}',[PaymentController::class,'destroy']);

        // Delivery Zones Routes
        Route::get('/delivery-zones', [DeliveryZoneController::class, 'index']);
        Route::post('/delivery-zones', [DeliveryZoneController::class, 'store']);
        Route::get('/delivery-zones/{id}', [DeliveryZoneController::class, 'show']);
        Route::put('/delivery-zones/{id}', [DeliveryZoneController::class, 'update']);
        Route::delete('/delivery-zones/{id}', [DeliveryZoneController::class, 'destroy']);

        // Bangladesh Location CRUD Routes (Admin only - authenticated)
        Route::post('/bangladeshi-divisions', [BangladeshLocationController::class, 'storeDivision']);
        Route::post('/bangladeshi-districts', [BangladeshLocationController::class, 'storeDistrict']);
        Route::post('/bangladeshi-areas', [BangladeshLocationController::class, 'storeArea']);
        Route::put('/bangladeshi-divisions/{id}', [BangladeshLocationController::class, 'updateDivision']);
        Route::put('/bangladeshi-districts/{id}', [BangladeshLocationController::class, 'updateDistrict']);
        Route::put('/bangladeshi-areas/{id}', [BangladeshLocationController::class, 'updateArea']);
        Route::delete('/bangladeshi-divisions/{id}', [BangladeshLocationController::class, 'destroyDivision']);
        Route::delete('/bangladeshi-districts/{id}', [BangladeshLocationController::class, 'destroyDistrict']);
        Route::delete('/bangladeshi-areas/{id}', [BangladeshLocationController::class, 'destroyArea']);

        // Customer Addresses Routes
        Route::get('/customer-addresses', [CustomerAddressController::class, 'index']);
        Route::post('/customer-addresses', [CustomerAddressController::class, 'store']);
        Route::get('/customer-addresses/{id}', [CustomerAddressController::class, 'show']);
        Route::put('/customer-addresses/{id}', [CustomerAddressController::class, 'update']);
        Route::delete('/customer-addresses/{id}', [CustomerAddressController::class, 'destroy']);

        // Order Status History Routes
        Route::get('/order-status-history', [OrderStatusHistoryController::class, 'index']);
        Route::post('/order-status-history', [OrderStatusHistoryController::class, 'store']);
        Route::get('/order-status-history/{id}', [OrderStatusHistoryController::class, 'show']);
        Route::put('/order-status-history/{id}', [OrderStatusHistoryController::class, 'update']);
        Route::delete('/order-status-history/{id}', [OrderStatusHistoryController::class, 'destroy']);




});












