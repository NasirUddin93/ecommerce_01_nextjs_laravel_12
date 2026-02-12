<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::table('orders', function (Blueprint $table) {
            if (!Schema::hasColumn('orders', 'coupon_id')) {
                $table->unsignedBigInteger('coupon_id')->nullable()->after('discount_amount');
                $table->foreign('coupon_id', 'orders_coupon_id_fk')
                    ->references('id')->on('coupons')->onDelete('set null');
                $table->index('coupon_id', 'orders_coupon_id_idx');
            }
        });
    }

    public function down(): void
    {
        Schema::table('orders', function (Blueprint $table) {
            if (Schema::hasColumn('orders', 'coupon_id')) {
                $table->dropForeign('orders_coupon_id_fk');
                $table->dropIndex('orders_coupon_id_idx');
                $table->dropColumn('coupon_id');
            }
        });
    }
};
