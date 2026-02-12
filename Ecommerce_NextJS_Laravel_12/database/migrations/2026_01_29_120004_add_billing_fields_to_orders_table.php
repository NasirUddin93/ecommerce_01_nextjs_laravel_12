<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::table('orders', function (Blueprint $table) {
            if (!Schema::hasColumn('orders', 'billing_address')) {
                $table->text('billing_address')->nullable()->after('country');
            }
            if (!Schema::hasColumn('orders', 'billing_city')) {
                $table->string('billing_city', 100)->nullable()->after('billing_address');
            }
            if (!Schema::hasColumn('orders', 'billing_district')) {
                $table->string('billing_district', 100)->nullable()->after('billing_city');
            }
            if (!Schema::hasColumn('orders', 'billing_area')) {
                $table->string('billing_area', 100)->nullable()->after('billing_district');
            }
            if (!Schema::hasColumn('orders', 'billing_postal_code')) {
                $table->string('billing_postal_code', 20)->nullable()->after('billing_area');
            }
            if (!Schema::hasColumn('orders', 'billing_country')) {
                $table->string('billing_country', 100)->default('Bangladesh')->nullable()->after('billing_postal_code');
            }
            if (!Schema::hasColumn('orders', 'billing_address_id')) {
                $table->unsignedBigInteger('billing_address_id')->nullable()->after('billing_country');
                $table->foreign('billing_address_id', 'orders_billing_address_id_fk')
                    ->references('id')->on('customer_addresses')->onDelete('set null');
                $table->index('billing_address_id', 'orders_billing_address_id_idx');
            }
            if (!Schema::hasColumn('orders', 'shipping_address_id')) {
                $table->unsignedBigInteger('shipping_address_id')->nullable()->after('billing_address_id');
                $table->foreign('shipping_address_id', 'orders_shipping_address_id_fk')
                    ->references('id')->on('customer_addresses')->onDelete('set null');
                $table->index('shipping_address_id', 'orders_shipping_address_id_idx');
            }
        });
    }

    public function down(): void
    {
        Schema::table('orders', function (Blueprint $table) {
            if (Schema::hasColumn('orders', 'shipping_address_id')) {
                $table->dropForeign('orders_shipping_address_id_fk');
                $table->dropIndex('orders_shipping_address_id_idx');
                $table->dropColumn('shipping_address_id');
            }
            if (Schema::hasColumn('orders', 'billing_address_id')) {
                $table->dropForeign('orders_billing_address_id_fk');
                $table->dropIndex('orders_billing_address_id_idx');
                $table->dropColumn('billing_address_id');
            }
            if (Schema::hasColumn('orders', 'billing_country')) {
                $table->dropColumn('billing_country');
            }
            if (Schema::hasColumn('orders', 'billing_postal_code')) {
                $table->dropColumn('billing_postal_code');
            }
            if (Schema::hasColumn('orders', 'billing_area')) {
                $table->dropColumn('billing_area');
            }
            if (Schema::hasColumn('orders', 'billing_district')) {
                $table->dropColumn('billing_district');
            }
            if (Schema::hasColumn('orders', 'billing_city')) {
                $table->dropColumn('billing_city');
            }
            if (Schema::hasColumn('orders', 'billing_address')) {
                $table->dropColumn('billing_address');
            }
        });
    }
};
