<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Create delivery_zones table for Bangladesh-specific delivery charges
     */
    public function up(): void
    {
        Schema::create('delivery_zones', function (Blueprint $table) {
            $table->id();
            
            // Zone information
            $table->string('zone_name', 255)->unique();
            $table->text('description')->nullable();
            $table->string('area_code', 50)->nullable();
            
            // Districts included in this zone
            $table->json('districts')->nullable(); // Array of district names/ids
            $table->json('areas')->nullable(); // Specific areas if applicable
            
            // Delivery charges
            $table->decimal('standard_delivery_charge', 8, 2);
            $table->decimal('express_delivery_charge', 8, 2)->nullable();
            
            // Estimated delivery time
            $table->integer('standard_delivery_days')->default(2);
            $table->integer('express_delivery_days')->nullable();
            
            // Minimum order value for free delivery
            $table->decimal('free_delivery_min_amount', 10, 2)->nullable();
            
            // Status
            $table->boolean('is_active')->default(true);
            
            // Priority for zone selection
            $table->integer('priority')->default(0);
            
            // Metadata
            $table->timestamps();
            $table->softDeletes();
            
            // Index
            $table->index('is_active');
            $table->index('priority');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('delivery_zones');
    }
};
