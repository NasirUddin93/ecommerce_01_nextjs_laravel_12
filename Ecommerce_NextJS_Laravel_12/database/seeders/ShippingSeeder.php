<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\Shipping;

class ShippingSeeder extends Seeder
{
    public function run(): void
    {
        $shippings = [
            [
                'name' => 'Standard Shipping',
                'description' => '5-7 business days delivery',
                'fee' => 5.99,
                'is_free_shipping' => false,
            ],
            [
                'name' => 'Express Shipping',
                'description' => '2-3 business days delivery',
                'fee' => 12.99,
                'is_free_shipping' => false,
            ],
            [
                'name' => 'Next Day Delivery',
                'description' => 'Overnight delivery',
                'fee' => 24.99,
                'is_free_shipping' => false,
            ],
            [
                'name' => 'Free Shipping',
                'description' => 'Free shipping on orders over $50',
                'fee' => 0,
                'is_free_shipping' => true,
            ],
            [
                'name' => 'International Shipping',
                'description' => '10-15 business days for international orders',
                'fee' => 29.99,
                'is_free_shipping' => false,
            ],
        ];

        foreach ($shippings as $shipping) {
            Shipping::create($shipping);
        }
    }
}
