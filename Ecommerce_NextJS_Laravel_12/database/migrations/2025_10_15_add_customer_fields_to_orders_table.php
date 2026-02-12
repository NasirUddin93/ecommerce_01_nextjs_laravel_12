<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;
use Illuminate\Support\Facades\DB;

return new class extends Migration
{
    /**
     * Add customer contact and shipping fields to orders table
     */
    public function up(): void
    {
        Schema::table('orders', function (Blueprint $table) {
            // Customer contact information - only add if they don't exist
            if (!Schema::hasColumn('orders', 'customer_name')) {
                $table->string('customer_name', 255)->nullable()->after('user_id');
            }
            if (!Schema::hasColumn('orders', 'customer_email')) {
                $table->string('customer_email', 255)->nullable()->after('customer_name');
            }
            if (!Schema::hasColumn('orders', 'customer_phone')) {
                $table->string('customer_phone', 20)->nullable()->after('customer_email');
            }

            // Shipping address - only add if they don't exist
            if (!Schema::hasColumn('orders', 'shipping_address')) {
                $table->text('shipping_address')->nullable()->after('customer_phone');
            }
            if (!Schema::hasColumn('orders', 'city')) {
                $table->string('city', 100)->nullable()->after('shipping_address');
            }
            if (!Schema::hasColumn('orders', 'district')) {
                $table->string('district', 100)->nullable()->after('city');
            }
            if (!Schema::hasColumn('orders', 'area')) {
                $table->string('area', 100)->nullable()->after('district');
            }
            if (!Schema::hasColumn('orders', 'postal_code')) {
                $table->string('postal_code', 20)->nullable()->after('area');
            }
            if (!Schema::hasColumn('orders', 'country')) {
                $table->string('country', 100)->default('Bangladesh')->after('postal_code');
            }

            // Additional order info - only add if they don't exist
            if (!Schema::hasColumn('orders', 'customer_notes')) {
                $table->text('customer_notes')->nullable()->after('status');
            }
            if (!Schema::hasColumn('orders', 'tracking_number')) {
                $table->string('tracking_number', 100)->nullable()->after('customer_notes');
            }
        });

        // Update payment_method enum if needed
        if (Schema::hasColumn('orders', 'payment_method')) {
            // Check current enum and update if needed
            DB::statement("ALTER TABLE orders MODIFY payment_method ENUM('cod', 'bkash', 'nagad', 'rocket', 'card', 'bank_transfer') DEFAULT 'cod'");
        }
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('orders', function (Blueprint $table) {
            $table->dropColumn([
                'customer_name',
                'customer_email',
                'customer_phone',
                'shipping_address',
                'city',
                'district',
                'area',
                'postal_code',
                'country',
                'customer_notes',
                'tracking_number'
            ]);
        });
    }
};
