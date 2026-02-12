<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::table('orders', function (Blueprint $table) {
            if (!Schema::hasColumn('orders', 'delivery_zone_id')) {
                $table->unsignedBigInteger('delivery_zone_id')->nullable()->after('country');
                $table->foreign('delivery_zone_id', 'orders_delivery_zone_id_fk')
                    ->references('id')->on('delivery_zones')->onDelete('restrict');
                $table->index('delivery_zone_id', 'orders_delivery_zone_id_idx');
            }
        });
    }

    public function down(): void
    {
        Schema::table('orders', function (Blueprint $table) {
            if (Schema::hasColumn('orders', 'delivery_zone_id')) {
                $table->dropForeign('orders_delivery_zone_id_fk');
                $table->dropIndex('orders_delivery_zone_id_idx');
                $table->dropColumn('delivery_zone_id');
            }
        });
    }
};
