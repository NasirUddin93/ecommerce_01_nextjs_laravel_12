<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::table('orders', function (Blueprint $table) {
            if (!Schema::hasColumn('orders', 'payment_id')) {
                $table->unsignedBigInteger('payment_id')->nullable()->after('final_amount');
                $table->foreign('payment_id', 'orders_payment_id_fk')
                    ->references('id')->on('payments')->onDelete('restrict');
                $table->index('payment_id', 'orders_payment_id_idx');
            }
        });
    }

    public function down(): void
    {
        Schema::table('orders', function (Blueprint $table) {
            if (Schema::hasColumn('orders', 'payment_id')) {
                $table->dropForeign('orders_payment_id_fk');
                $table->dropIndex('orders_payment_id_idx');
                $table->dropColumn('payment_id');
            }
        });
    }
};
