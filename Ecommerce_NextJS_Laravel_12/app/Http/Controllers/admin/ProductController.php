<?php

namespace App\Http\Controllers\admin;

use App\Http\Controllers\Controller;
use App\Models\Product;
use App\Models\ProductImage;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Str;

class ProductController extends Controller
{
    /**
     * 🧾 List all products with images (with pagination)
     */
    public function index(Request $request)
    {
        $perPage = $request->input('per_page', 10); // Default 10 items per page
        $page = $request->input('page', 1);
        
        $products = Product::with('category','brand','images')
            ->latest()
            ->paginate($perPage);

        return response()->json([
            'success' => true,
            'status' => 200,
            'data' => $products->items(),
            'pagination' => [
                'current_page' => $products->currentPage(),
                'total' => $products->total(),
                'per_page' => $products->perPage(),
                'last_page' => $products->lastPage(),
                'from' => $products->firstItem(),
                'to' => $products->lastItem(),
            ]
        ], 200);
    }

    /**
     * 🔍 Search products
     */
    public function search(Request $request)
    {
        $search = $request->query('search', '');
        $sort = $request->query('sort', 'relevance');
        $minPrice = $request->query('min_price', 0);
        $maxPrice = $request->query('max_price', 999999);
        $minRating = $request->query('min_rating', 0);
        $limit = $request->query('limit', 20);

        $query = Product::with(['images', 'category', 'brand'])
            ->whereBetween('price', [$minPrice, $maxPrice])
            ->where('rating', '>=', $minRating);

        if ($search) {
            $query->where(function ($q) use ($search) {
                $q->where('name', 'like', "%{$search}%")
                  ->orWhere('description', 'like', "%{$search}%")
                  ->orWhereHas('category', function ($q) use ($search) {
                      $q->where('name', 'like', "%{$search}%");
                  })
                  ->orWhereHas('brand', function ($q) use ($search) {
                      $q->where('name', 'like', "%{$search}%");
                  });
            });
        }

        // Apply sorting
        switch ($sort) {
            case 'price_low':
                $query->orderBy('price', 'asc');
                break;
            case 'price_high':
                $query->orderBy('price', 'desc');
                break;
            case 'newest':
                $query->latest('created_at');
                break;
            case 'rating':
                $query->orderBy('rating', 'desc');
                break;
            case 'relevance':
            default:
                if ($search) {
                    // Relevance sort - prioritize name matches
                    $query->orderByRaw("CASE WHEN name LIKE ? THEN 0 ELSE 1 END", ["%{$search}%"])
                          ->orderBy('created_at', 'desc');
                } else {
                    $query->latest('created_at');
                }
        }

        $products = $query->limit($limit)->get();

        return response()->json([
            'status' => 200,
            'data' => $products,
            'message' => 'Search results',
        ], 200);
    }

    /**
     * 🆕 Store new product with multiple images
     */
    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'category_id' => 'required|exists:categories,id',
            'brand_id' => 'required|exists:brands,id',
            'name' => 'required|string|max:255',
            'sku' => 'required|string|max:100|unique:products,sku',
            'description' => 'nullable|string',
            'base_price' => 'required|numeric|min:0',
            'stock_quantity' => 'required|integer|min:0',
            'weight' => 'nullable|numeric|min:0',
            'is_seasonal' => 'nullable|boolean',
            'seasonal_start_date' => 'nullable|date',
            'seasonal_end_date' => 'nullable|date',
            'status' => 'nullable|in:active,inactive',
            'images.*' => 'nullable|image|mimes:jpg,jpeg,png,webp|max:2048',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'success' => false,
                'status' => 422,
                'errors' => $validator->errors()
            ], 422);
        }

        $product = Product::create($validator->validated());

        // Handle images
        if ($request->hasFile('images')) {
            foreach ($request->file('images') as $key => $image) {
                $path = $image->store('uploads/products', 'public');
                ProductImage::create([
                    'product_id' => $product->id,
                    'image_url' => '/storage/' . $path,
                    'is_primary' => $key === 0, // first image = primary
                ]);
            }
        }

        return response()->json([
            'success' => true,
            'message' => 'Product created successfully',
            'data' => $product->load('images')
        ], 201);
    }

    /**
     * 📦 Show single product with images
     */
    public function show($id)
    {
        $product = Product::with('images')->find($id);

        if (!$product) {
            return response()->json(['success' => false, 'message' => 'Product not found'], 404);
        }

        return response()->json(['success' => true, 'data' => $product], 200);
    }

    /**
     * ✏️ Update product with optional new images
     */
    public function update(Request $request, $id)
    {
        $product = Product::find($id);

        if (!$product) {
            return response()->json(['success' => false, 'message' => 'Product not found'], 404);
        }

        $validator = Validator::make($request->all(), [
            'category_id' => 'sometimes|exists:categories,id',
            'brand_id' => 'sometimes|exists:brands,id',
            'name' => 'sometimes|string|max:255',
            'sku' => 'sometimes|string|max:100|unique:products,sku,' . $id,
            'description' => 'nullable|string',
            'base_price' => 'sometimes|numeric|min:0',
            'stock_quantity' => 'sometimes|integer|min:0',
            'weight' => 'nullable|numeric|min:0',
            'is_seasonal' => 'nullable|boolean',
            'seasonal_start_date' => 'nullable|date',
            'seasonal_end_date' => 'nullable|date',
            'status' => 'sometimes|in:active,inactive',
            'images.*' => 'nullable|image|mimes:jpg,jpeg,png,webp|max:2048',
            'images_to_delete.*' => 'nullable|integer|exists:product_images,id',
        ]);

        if ($validator->fails()) {
            return response()->json(['success' => false, 'errors' => $validator->errors()], 422);
        }

        // Update product details (filter out null values)
        $updateData = array_filter($validator->validated(), function($value) {
            return $value !== null;
        });
        
        // Remove image-related fields from product update
        unset($updateData['images']);
        unset($updateData['images_to_delete']);
        
        $product->update($updateData);

        // Handle image deletion
        if ($request->has('images_to_delete')) {
            $imagesToDelete = $request->input('images_to_delete', []);
            foreach ($imagesToDelete as $imageId) {
                $image = ProductImage::find($imageId);
                if ($image && $image->product_id === $product->id) {
                    // Delete file from storage if it exists
                    if ($image->image_url && str_contains($image->image_url, '/storage/')) {
                        $filePath = str_replace('/storage/', '', $image->image_url);
                        if (Storage::disk('public')->exists($filePath)) {
                            Storage::disk('public')->delete($filePath);
                        }
                    }
                    // Delete database record
                    $image->delete();
                }
            }
        }

        // Handle new images if uploaded
        if ($request->hasFile('images')) {
            // Get current highest is_primary value (0 or 1)
            $existingPrimaryCount = ProductImage::where('product_id', $product->id)->where('is_primary', true)->count();
            
            foreach ($request->file('images') as $key => $image) {
                $path = $image->store('uploads/products', 'public');
                
                // Set first uploaded image as primary only if no existing primary image
                $isPrimary = ($key === 0 && $existingPrimaryCount === 0);
                
                ProductImage::create([
                    'product_id' => $product->id,
                    'image_url' => '/storage/' . $path,
                    'is_primary' => $isPrimary,
                ]);
            }
        }

        return response()->json([
            'success' => true,
            'message' => 'Product updated successfully',
            'data' => $product->load('category', 'brand', 'images')
        ], 200);
    }

    /**
     * 🗑️ Soft delete product
     */
    public function destroy($id)
    {
        $product = Product::find($id);

        if (!$product) {
            return response()->json(['success' => false, 'message' => 'Product not found'], 404);
        }

        $product->delete();

        return response()->json(['success' => true, 'message' => 'Product deleted successfully'], 200);
    }

    /**
     * 🏷️ Get products on sale (with active discounts)
     */
    public function getSaleProducts()
    {
        $now = now();
        
        $saleProducts = Product::with(['category', 'brand', 'images'])
            ->whereHas('discounts', function($query) use ($now) {
                $query->where('valid_from', '<=', $now)
                      ->where('valid_to', '>=', $now);
            })
            ->where('status', 'active')
            ->get()
            ->map(function($product) use ($now) {
                // Get the active discount
                $discount = $product->discounts()
                    ->where('valid_from', '<=', $now)
                    ->where('valid_to', '>=', $now)
                    ->first();
                
                if ($discount) {
                    $discountValue = $discount->discount_value;
                    $discountType = $discount->discount_type;
                    
                    // Calculate discounted price
                    if ($discountType === 'percentage') {
                        $discountedPrice = $product->base_price - ($product->base_price * $discountValue / 100);
                        $discountAmount = $product->base_price * $discountValue / 100;
                    } else {
                        // Fixed amount discount
                        $discountedPrice = max(0, $product->base_price - $discountValue);
                        $discountAmount = $discountValue;
                    }
                    
                    return [
                        'id' => $product->id,
                        'name' => $product->name,
                        'sku' => $product->sku,
                        'description' => $product->description,
                        'category' => $product->category,
                        'brand' => $product->brand,
                        'original_price' => (float)$product->base_price,
                        'discounted_price' => round($discountedPrice, 2),
                        'discount_percentage' => $discountType === 'percentage' ? $discountValue : round(($discountAmount / $product->base_price) * 100, 2),
                        'discount_amount' => round($discountAmount, 2),
                        'discount_type' => $discountType,
                        'stock_quantity' => $product->stock_quantity,
                        'images' => $product->images,
                        'sale_end_date' => $discount->valid_to,
                        'status' => $product->status,
                        'created_at' => $product->created_at,
                    ];
                }
                
                return null;
            })
            ->filter();

        return response()->json([
            'success' => true,
            'status' => 200,
            'data' => $saleProducts->values()
        ], 200);
    }
}
