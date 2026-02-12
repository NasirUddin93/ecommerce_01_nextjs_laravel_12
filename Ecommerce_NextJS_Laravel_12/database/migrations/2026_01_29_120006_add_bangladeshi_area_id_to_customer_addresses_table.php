<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::table('customer_addresses', function (Blueprint $table) {
            if (!Schema::hasColumn('customer_addresses', 'bangladeshi_area_id')) {
                $table->unsignedBigInteger('bangladeshi_area_id')->nullable()->after('area');
                $table->foreign('bangladeshi_area_id', 'customer_addresses_area_id_fk')
                    ->references('id')->on('bangladeshi_areas')->onDelete('set null');
                $table->index('bangladeshi_area_id', 'customer_addresses_area_id_idx');
            }
        });
    }

    public function down(): void
    {
        Schema::table('customer_addresses', function (Blueprint $table) {
            if (Schema::hasColumn('customer_addresses', 'bangladeshi_area_id')) {
                $table->dropForeign('customer_addresses_area_id_fk');
                $table->dropIndex('customer_addresses_area_id_idx');
                $table->dropColumn('bangladeshi_area_id');
            }
        });
    }
};
