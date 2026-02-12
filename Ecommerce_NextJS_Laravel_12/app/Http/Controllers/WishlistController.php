<?php

namespace App\Http\Controllers;

use App\Models\Wishlist;
use Illuminate\Http\Request;

class WishlistController extends Controller
{
    /**
     * Display the authenticated user's wishlist.
     */
    public function index(Request $request)
    {
        $userId = $request->user()->id;

        $wishlists = Wishlist::with(['product.images'])
            ->where('user_id', $userId)
            ->latest()
            ->get();

        return response()->json([
            'data' => $wishlists,
        ], 200);
    }

    /**
     * Add a product to the authenticated user's wishlist (idempotent).
     */
    public function store(Request $request)
    {
        $validated = $request->validate([
            'product_id' => 'required|exists:products,id',
        ]);

        $userId = $request->user()->id;
        $productId = $validated['product_id'];

        $existing = Wishlist::withTrashed()
            ->where('user_id', $userId)
            ->where('product_id', $productId)
            ->first();

        if ($existing) {
            if ($existing->trashed()) {
                $existing->restore();
            }

            $existing->load(['product.images']);

            return response()->json([
                'message' => 'Wishlist item already exists.',
                'data' => $existing,
            ], 200);
        }

        $wishlist = Wishlist::create([
            'user_id' => $userId,
            'product_id' => $productId,
        ]);

        $wishlist->load(['product.images']);

        return response()->json([
            'message' => 'Wishlist item added successfully.',
            'data' => $wishlist,
        ], 201);
    }

    /**
     * Remove a product from the authenticated user's wishlist.
     */
    public function destroy(Request $request, $productId)
    {
        $userId = $request->user()->id;

        $wishlist = Wishlist::where('user_id', $userId)
            ->where('product_id', $productId)
            ->first();

        if (!$wishlist) {
            return response()->json([
                'message' => 'Wishlist item not found.',
            ], 404);
        }

        $wishlist->delete();

        return response()->json([
            'message' => 'Wishlist item removed successfully.',
        ], 200);
    }
}
