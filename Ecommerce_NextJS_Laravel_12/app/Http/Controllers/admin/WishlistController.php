<?php

namespace App\Http\Controllers\admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Wishlist;

class WishlistController extends Controller
{
    /**
     * Display a listing of all wishlists.
     */
    public function index(Request $request)
    {
        $perPage = $request->input('per_page', 10);
        $page = $request->input('page', 1);
        
        $wishlists = Wishlist::with(['user', 'product.images'])->latest()->paginate($perPage, ['*'], 'page', $page);
        
        return response()->json([
            'data'=>$wishlists->items(),
            'status'=>200,
            'success'=>'data is found successfully',
            'pagination' => [
                'total' => $wishlists->total(),
                'per_page' => $wishlists->perPage(),
                'current_page' => $wishlists->currentPage(),
                'last_page' => $wishlists->lastPage(),
                'from' => $wishlists->firstItem(),
                'to' => $wishlists->lastItem(),
            ]
        ], 200);
    }

    /**
     * Store a new wishlist record.
     */
    public function store(Request $request)
    {
        $validated = $request->validate([
            'user_id' => 'required|exists:users,id',
            'product_id' => 'required|exists:products,id',
        ]);

        $wishlist = Wishlist::create($validated);

        return response()->json([
            'message' => 'Wishlist item added successfully.',
            'data' => $wishlist,
        ], 201);
    }

    /**
     * Show a specific wishlist record.
     */
    public function show($id)
    {
        $wishlist = Wishlist::with(['user', 'product.images'])->findOrFail($id);
        return response()->json($wishlist, 200);
    }

    /**
     * Delete a wishlist record (soft delete).
     */
    public function destroy($id)
    {
        $wishlist = Wishlist::findOrFail($id);
        $wishlist->delete();

        return response()->json(['message' => 'Wishlist item removed successfully.'], 200);
    }
}
