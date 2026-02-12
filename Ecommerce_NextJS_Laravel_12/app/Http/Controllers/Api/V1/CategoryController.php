<?php

namespace App\Http\Controllers\Api\V1;

use App\Models\Category;
use Illuminate\Http\Request;

class CategoryController extends ApiController
{
    public function index(Request $request)
    {
        $perPage = min((int) $request->query('per_page', 20), 100);
        $categories = Category::query()->orderBy('id', 'desc')->paginate($perPage);

        return $this->paginated($categories, 'Categories retrieved');
    }

    public function show($id)
    {
        $category = Category::findOrFail($id);

        return $this->success($category, 'Category retrieved');
    }
}
