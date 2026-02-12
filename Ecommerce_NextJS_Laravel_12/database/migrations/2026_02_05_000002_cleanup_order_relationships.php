<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Remove duplicate order relations and fix user FK delete behavior
     */
    public function up(): void
    {
        Schema::table('orders', function (Blueprint $table) {
            // Fix user_id FK to set null on delete
            if (Schema::hasColumn('orders', 'user_id')) {
                $table->dropForeign(['user_id']);
                $table->unsignedBigInteger('user_id')->nullable()->change();
                $table->foreign('user_id')->references('id')->on('users')->onDelete('set null');
            }

            // Remove duplicate payment/shipping relations on orders
            if (Schema::hasColumn('orders', 'payment_id')) {
                $table->dropForeign('orders_payment_id_fk');
                $table->dropIndex('orders_payment_id_idx');
                $table->dropColumn('payment_id');
            }

            if (Schema::hasColumn('orders', 'order_shipping_id')) {
                $table->dropForeign('orders_order_shipping_id_fk');
                $table->dropIndex('orders_order_shipping_id_idx');
                $table->dropColumn('order_shipping_id');
            }

            if (Schema::hasColumn('orders', 'shipping_method_id')) {
                $table->dropForeign('orders_shipping_method_id_fk');
                $table->dropIndex('orders_shipping_method_id_idx');
                $table->dropColumn('shipping_method_id');
            }
        });
    }

    public function down(): void
    {
        Schema::table('orders', function (Blueprint $table) {
            // Restore nullable user_id FK with cascade (previous behavior)
            if (Schema::hasColumn('orders', 'user_id')) {
                $table->dropForeign(['user_id']);
                $table->unsignedBigInteger('user_id')->nullable()->change();
                $table->foreign('user_id')->references('id')->on('users')->onDelete('cascade');
            }

            // Recreate columns if needed (no data restoration)
            if (!Schema::hasColumn('orders', 'payment_id')) {
                $table->unsignedBigInteger('payment_id')->nullable();
                $table->foreign('payment_id', 'orders_payment_id_fk')
                    ->references('id')->on('payments')->onDelete('restrict');
                $table->index('payment_id', 'orders_payment_id_idx');
            }

            if (!Schema::hasColumn('orders', 'order_shipping_id')) {
                $table->unsignedBigInteger('order_shipping_id')->nullable();
                $table->foreign('order_shipping_id', 'orders_order_shipping_id_fk')
                    ->references('id')->on('order_shippings')->onDelete('set null');
                $table->index('order_shipping_id', 'orders_order_shipping_id_idx');
            }

            if (!Schema::hasColumn('orders', 'shipping_method_id')) {
                $table->unsignedBigInteger('shipping_method_id')->nullable();
                $table->foreign('shipping_method_id', 'orders_shipping_method_id_fk')
                    ->references('id')->on('shipping_methods')->onDelete('restrict');
                $table->index('shipping_method_id', 'orders_shipping_method_id_idx');
            }
        });
    }
};
