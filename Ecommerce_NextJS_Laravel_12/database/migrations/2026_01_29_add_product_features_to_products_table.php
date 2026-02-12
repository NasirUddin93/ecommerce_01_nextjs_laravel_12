<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::table('products', function (Blueprint $table) {
            // Feature flags
            $table->boolean('is_new')->default(false)->after('is_seasonal');
            $table->boolean('is_bestseller')->default(false)->after('is_new');
            $table->boolean('is_featured')->default(false)->after('is_bestseller');
            
            // Product metrics
            $table->integer('sales_count')->default(0)->after('is_featured');
            $table->decimal('rating', 3, 2)->default(0)->after('sales_count');
            $table->integer('review_count')->default(0)->after('rating');
            
            // Image and sorting
            $table->string('featured_image')->nullable()->after('review_count');
            $table->integer('display_order')->default(0)->after('featured_image');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('products', function (Blueprint $table) {
            $table->dropColumn([
                'is_new',
                'is_bestseller',
                'is_featured',
                'sales_count',
                'rating',
                'review_count',
                'featured_image',
                'display_order',
            ]);
        });
    }
};
