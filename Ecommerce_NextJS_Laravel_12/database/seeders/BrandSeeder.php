<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\Brand;

class BrandSeeder extends Seeder
{
    public function run(): void
    {
        $brands = [
            ['name' => 'Nike', 'status' => 1],
            ['name' => 'Adidas', 'status' => 1],
            ['name' => 'Apple', 'status' => 1],
            ['name' => 'Samsung', 'status' => 1],
            ['name' => 'Sony', 'status' => 1],
            ['name' => 'LG', 'status' => 1],
            ['name' => 'Dell', 'status' => 1],
            ['name' => 'HP', 'status' => 1],
            ['name' => 'Zara', 'status' => 1],
            ['name' => 'H&M', 'status' => 1],
            ['name' => 'Puma', 'status' => 1],
            ['name' => 'Canon', 'status' => 1],
            ['name' => 'Nikon', 'status' => 1],
            ['name' => 'Bose', 'status' => 1],
            ['name' => 'JBL', 'status' => 1],
        ];

        foreach ($brands as $brand) {
            Brand::create($brand);
        }
    }
}
