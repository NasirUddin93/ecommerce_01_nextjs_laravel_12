<?php

namespace App\Http\Controllers\Api\V1;

use App\Models\Brand;
use Illuminate\Http\Request;

class BrandController extends ApiController
{
    public function index(Request $request)
    {
        $perPage = min((int) $request->query('per_page', 20), 100);
        $brands = Brand::query()->orderBy('id', 'desc')->paginate($perPage);

        return $this->paginated($brands, 'Brands retrieved');
    }

    public function show($id)
    {
        $brand = Brand::findOrFail($id);

        return $this->success($brand, 'Brand retrieved');
    }
}
