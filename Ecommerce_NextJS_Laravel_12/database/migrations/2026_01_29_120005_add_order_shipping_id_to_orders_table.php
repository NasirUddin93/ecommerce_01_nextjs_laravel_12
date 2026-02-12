<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::table('orders', function (Blueprint $table) {
            if (!Schema::hasColumn('orders', 'order_shipping_id')) {
                $table->unsignedBigInteger('order_shipping_id')->nullable()->after('shipping_method_id');
                $table->foreign('order_shipping_id', 'orders_order_shipping_id_fk')
                    ->references('id')->on('order_shippings')->onDelete('set null');
                $table->index('order_shipping_id', 'orders_order_shipping_id_idx');
            }
        });
    }

    public function down(): void
    {
        Schema::table('orders', function (Blueprint $table) {
            if (Schema::hasColumn('orders', 'order_shipping_id')) {
                $table->dropForeign('orders_order_shipping_id_fk');
                $table->dropIndex('orders_order_shipping_id_idx');
                $table->dropColumn('order_shipping_id');
            }
        });
    }
};
