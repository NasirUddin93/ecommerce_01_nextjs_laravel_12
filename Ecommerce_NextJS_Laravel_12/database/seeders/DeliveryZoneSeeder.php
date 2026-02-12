<?php

namespace Database\Seeders;

use App\Models\DeliveryZone;
use Illuminate\Database\Seeder;

class DeliveryZoneSeeder extends Seeder
{
    public function run(): void
    {
        $allDistricts = [
            'Dhaka', 'Gazipur', 'Narayanganj', 'Narsingdi', 'Munshiganj', 'Manikganj', 'Tangail', 'Kishoreganj',
            'Faridpur', 'Gopalganj', 'Madaripur', 'Rajbari', 'Shariatpur',
            'Chattogram', "Cox's Bazar", 'Cumilla', 'Brahmanbaria', 'Chandpur', 'Feni', 'Lakshmipur', 'Noakhali',
            'Khagrachhari', 'Rangamati', 'Bandarban',
            'Rajshahi', 'Bogura', 'Pabna', 'Sirajganj', 'Naogaon', 'Natore', 'Chapainawabganj', 'Joypurhat',
            'Khulna', 'Jashore', 'Satkhira', 'Bagerhat', 'Narail', 'Jhenaidah', 'Kushtia', 'Magura', 'Chuadanga', 'Meherpur',
            'Barishal', 'Bhola', 'Patuakhali', 'Pirojpur', 'Barguna', 'Jhalokati',
            'Sylhet', 'Moulvibazar', 'Habiganj', 'Sunamganj',
            'Rangpur', 'Dinajpur', 'Kurigram', 'Lalmonirhat', 'Nilphamari', 'Panchagarh', 'Thakurgaon', 'Gaibandha',
            'Mymensingh', 'Jamalpur', 'Sherpur', 'Netrokona',
        ];

        DeliveryZone::firstOrCreate(
            ['zone_name' => 'Dhaka Metro'],
            [
                'description' => 'Dhaka metro and nearby districts',
                'districts' => ['Dhaka', 'Gazipur', 'Narayanganj'],
                'areas' => null,
                'standard_delivery_charge' => 60.00,
                'express_delivery_charge' => 120.00,
                'standard_delivery_days' => 2,
                'express_delivery_days' => 1,
                'free_delivery_min_amount' => 1500.00,
                'is_active' => true,
                'priority' => 100,
            ]
        );

        DeliveryZone::firstOrCreate(
            ['zone_name' => 'Major Cities'],
            [
                'description' => 'Major cities outside Dhaka',
                'districts' => ['Chattogram', 'Rajshahi', 'Khulna', 'Sylhet', 'Barishal', 'Rangpur', 'Mymensingh'],
                'areas' => null,
                'standard_delivery_charge' => 80.00,
                'express_delivery_charge' => 150.00,
                'standard_delivery_days' => 3,
                'express_delivery_days' => 2,
                'free_delivery_min_amount' => 2000.00,
                'is_active' => true,
                'priority' => 50,
            ]
        );

        DeliveryZone::firstOrCreate(
            ['zone_name' => 'Nationwide'],
            [
                'description' => 'All districts (fallback)',
                'districts' => $allDistricts,
                'areas' => null,
                'standard_delivery_charge' => 100.00,
                'express_delivery_charge' => null,
                'standard_delivery_days' => 4,
                'express_delivery_days' => null,
                'free_delivery_min_amount' => 2500.00,
                'is_active' => true,
                'priority' => 10,
            ]
        );
    }
}
