<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Normalize delivery zones with pivot tables
     */
    public function up(): void
    {
        Schema::create('delivery_zone_districts', function (Blueprint $table) {
            $table->id();
            $table->foreignId('delivery_zone_id')->constrained('delivery_zones')->onDelete('cascade');
            $table->foreignId('district_id')->constrained('bangladeshi_districts')->onDelete('cascade');
            $table->timestamps();

            $table->unique(['delivery_zone_id', 'district_id'], 'delivery_zone_districts_unique');
            $table->index('delivery_zone_id', 'delivery_zone_districts_zone_idx');
            $table->index('district_id', 'delivery_zone_districts_district_idx');
        });

        Schema::create('delivery_zone_areas', function (Blueprint $table) {
            $table->id();
            $table->foreignId('delivery_zone_id')->constrained('delivery_zones')->onDelete('cascade');
            $table->foreignId('area_id')->constrained('bangladeshi_areas')->onDelete('cascade');
            $table->timestamps();

            $table->unique(['delivery_zone_id', 'area_id'], 'delivery_zone_areas_unique');
            $table->index('delivery_zone_id', 'delivery_zone_areas_zone_idx');
            $table->index('area_id', 'delivery_zone_areas_area_idx');
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('delivery_zone_areas');
        Schema::dropIfExists('delivery_zone_districts');
    }
};
