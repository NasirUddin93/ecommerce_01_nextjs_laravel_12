<?php

namespace App\Http\Controllers\Api\V1;

use App\Models\Product;
use App\Models\ProductImage;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Validator;

class MediaController extends ApiController
{
    public function uploadProfileImage(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'image' => 'required|image|max:2048',
        ]);

        if ($validator->fails()) {
            return $this->error('Validation failed', 422, 'validation_error', $validator->errors()->toArray());
        }

        $path = $request->file('image')->store('user-avatars', 'public');
        $url = Storage::disk('public')->url($path);

        $user = $request->user();
        $user->update(['profile_image' => $url]);

        return $this->success(['url' => $url], 'Profile image uploaded');
    }

    public function uploadProductImage(Request $request, $productId)
    {
        $user = $request->user();
        if ($user->role !== 'admin') {
            return $this->error('Forbidden', 403, 'forbidden');
        }

        $validator = Validator::make($request->all(), [
            'image' => 'required|image|max:4096',
            'is_primary' => 'nullable|boolean',
        ]);

        if ($validator->fails()) {
            return $this->error('Validation failed', 422, 'validation_error', $validator->errors()->toArray());
        }

        $product = Product::findOrFail($productId);
        $path = $request->file('image')->store('product-images', 'public');
        $url = Storage::disk('public')->url($path);

        $image = ProductImage::create([
            'product_id' => $product->id,
            'image_url' => $url,
            'is_primary' => (bool) $request->input('is_primary', false),
        ]);

        return $this->success($image, 'Product image uploaded', 201);
    }
}
