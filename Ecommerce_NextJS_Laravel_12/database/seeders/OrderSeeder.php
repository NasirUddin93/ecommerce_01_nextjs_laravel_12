<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\Order;
use App\Models\User;
use Carbon\Carbon;

class OrderSeeder extends Seeder
{
    public function run(): void
    {
        $users = User::all();

        if ($users->isEmpty()) {
            $this->command->info('No users found. Please run UserSeeder first.');
            return;
        }

        $statuses = ['pending', 'paid', 'shipped', 'delivered', 'cancelled'];

        for ($i = 1; $i <= 50; $i++) {
            $totalAmount = rand(50, 1000);
            $discountAmount = rand(0, 100);
            $shippingFee = rand(0, 50);
            $finalAmount = $totalAmount - $discountAmount + $shippingFee;

            Order::create([
                'user_id' => $users->random()->id,
                'total_amount' => $totalAmount,
                'discount_amount' => $discountAmount,
                'shipping_fee' => $shippingFee,
                'final_amount' => $finalAmount,
                'status' => $statuses[array_rand($statuses)],
                'created_at' => Carbon::now()->subDays(rand(0, 90)),
            ]);
        }
    }
}
