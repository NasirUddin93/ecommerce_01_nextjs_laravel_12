<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::table('orders', function (Blueprint $table) {
            if (!Schema::hasColumn('orders', 'shipping_method_id')) {
                $table->unsignedBigInteger('shipping_method_id')->nullable()->after('tracking_number');
                $table->foreign('shipping_method_id', 'orders_shipping_method_id_fk')
                    ->references('id')->on('shipping_methods')->onDelete('restrict');
                $table->index('shipping_method_id', 'orders_shipping_method_id_idx');
            }
        });
    }

    public function down(): void
    {
        Schema::table('orders', function (Blueprint $table) {
            if (Schema::hasColumn('orders', 'shipping_method_id')) {
                $table->dropForeign('orders_shipping_method_id_fk');
                $table->dropIndex('orders_shipping_method_id_idx');
                $table->dropColumn('shipping_method_id');
            }
        });
    }
};
