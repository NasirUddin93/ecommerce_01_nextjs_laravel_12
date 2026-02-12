<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::table('order_items', function (Blueprint $table) {
            if (!Schema::hasColumn('order_items', 'category_id')) {
                $table->unsignedBigInteger('category_id')->nullable()->after('product_id');
                $table->foreign('category_id', 'order_items_category_id_fk')
                    ->references('id')->on('categories')->onDelete('set null');
                $table->index('category_id', 'order_items_category_id_idx');
            }
        });
    }

    public function down(): void
    {
        Schema::table('order_items', function (Blueprint $table) {
            if (Schema::hasColumn('order_items', 'category_id')) {
                $table->dropForeign('order_items_category_id_fk');
                $table->dropIndex('order_items_category_id_idx');
                $table->dropColumn('category_id');
            }
        });
    }
};
