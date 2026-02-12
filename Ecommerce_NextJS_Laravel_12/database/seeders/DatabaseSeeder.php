<?php

namespace Database\Seeders;

use App\Models\User;
// use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     */
    public function run(): void
    {
        $this->command->info('🌱 Starting database seeding...');

        // Run seeders in the correct order (respecting foreign key constraints)
        $this->call([
            UserSeeder::class,
            CategorySeeder::class,
            BrandSeeder::class,
            SizeSeeder::class,
            ShippingSeeder::class,
            ShippingMethodSeeder::class,
            BangladeshLocationSeeder::class,
            DeliveryZoneSeeder::class,
            ProductSeeder::class,
            ProductImageSeeder::class,
            ProductVariantSeeder::class,
            CouponSeeder::class,
            DiscountSeeder::class,
            OrderSeeder::class,
            OrderItemSeeder::class,
            OrderShippingSeeder::class,
            PaymentSeeder::class,
            TransactionSeeder::class,
            CouponUsageSeeder::class,
            ReviewSeeder::class,
            WishlistSeeder::class,
            NotificationSeeder::class,
            InventoryLogSeeder::class,
            BackfillForeignKeysSeeder::class,
        ]);

        $this->command->info('✅ Database seeding completed successfully!');
    }
}
