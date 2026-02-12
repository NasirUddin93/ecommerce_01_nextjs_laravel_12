<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use App\Models\Category;
use App\Models\Brand;
use App\Models\ProductImage;

class Product extends Model
{
    use SoftDeletes;

    protected $fillable = [
        'category_id',
        'brand_id',
        'name',
        'sku',
        'barcode',
        'description',
        'base_price',
        'stock_quantity',
        'weight',
        'is_seasonal',
        'seasonal_start_date',
        'seasonal_end_date',
        'status',
        'is_new',
        'is_bestseller',
        'is_featured',
        'sales_count',
        'rating',
        'review_count',
        'featured_image',
        'display_order',
    ];

    // Relationships
    public function category()
    {
        return $this->belongsTo(Category::class);
    }

    public function brand()
    {
        return $this->belongsTo(Brand::class);
    }
    public function images()
    {
        return $this->hasMany(ProductImage::class);
    }

    public function discounts()
    {
        return $this->hasMany(Discount::class);
    }
}
