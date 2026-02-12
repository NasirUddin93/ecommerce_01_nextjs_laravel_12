<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;
use Illuminate\Support\Facades\DB;

return new class extends Migration
{
    private function indexExists(string $table, string $index): bool
    {
        return !empty(DB::select("SHOW INDEX FROM {$table} WHERE Key_name = ?", [$index]));
    }

    /**
     * Add unique constraints and indexes for consistency/performance
     */
    public function up(): void
    {
        // Deduplicate reviews so unique constraint can be added safely
        DB::statement(
            "DELETE r1 FROM reviews r1 " .
            "INNER JOIN reviews r2 " .
            "ON r1.user_id = r2.user_id AND r1.product_id = r2.product_id " .
            "AND r1.id < r2.id"
        );

        if (!$this->indexExists('product_variants', 'product_variants_unique_variant')) {
            Schema::table('product_variants', function (Blueprint $table) {
                $table->unique(['product_id', 'size_id', 'color'], 'product_variants_unique_variant');
            });
        }

        if (!$this->indexExists('reviews', 'reviews_user_product_unique')) {
            Schema::table('reviews', function (Blueprint $table) {
                $table->unique(['user_id', 'product_id'], 'reviews_user_product_unique');
            });
        }

        if (!$this->indexExists('bangladeshi_areas', 'bangladeshi_areas_district_code_unique')) {
            Schema::table('bangladeshi_areas', function (Blueprint $table) {
                $table->unique(['district_id', 'code'], 'bangladeshi_areas_district_code_unique');
            });
        }

        $productImagesProductIdIdx = $this->indexExists('product_images', 'product_images_product_id_idx');
        $productImagesIsPrimaryIdx = $this->indexExists('product_images', 'product_images_is_primary_idx');
        $productImagesProductPrimaryIdx = $this->indexExists('product_images', 'product_images_product_primary_idx');

        Schema::table('product_images', function (Blueprint $table) use (
            $productImagesProductIdIdx,
            $productImagesIsPrimaryIdx,
            $productImagesProductPrimaryIdx
        ) {
            if (!$productImagesProductIdIdx) {
                $table->index('product_id', 'product_images_product_id_idx');
            }
            if (!$productImagesIsPrimaryIdx) {
                $table->index('is_primary', 'product_images_is_primary_idx');
            }
            if (!$productImagesProductPrimaryIdx) {
                $table->index(['product_id', 'is_primary'], 'product_images_product_primary_idx');
            }
        });

        $productsStatusIdx = $this->indexExists('products', 'products_status_idx');
        $productsIsNewIdx = $this->indexExists('products', 'products_is_new_idx');
        $productsIsBestsellerIdx = $this->indexExists('products', 'products_is_bestseller_idx');
        $productsIsFeaturedIdx = $this->indexExists('products', 'products_is_featured_idx');
        $productsCreatedAtIdx = $this->indexExists('products', 'products_created_at_idx');
        $productsBasePriceIdx = $this->indexExists('products', 'products_base_price_idx');
        $productsRatingIdx = $this->indexExists('products', 'products_rating_idx');
        $productsSalesCountIdx = $this->indexExists('products', 'products_sales_count_idx');

        Schema::table('products', function (Blueprint $table) use (
            $productsStatusIdx,
            $productsIsNewIdx,
            $productsIsBestsellerIdx,
            $productsIsFeaturedIdx,
            $productsCreatedAtIdx,
            $productsBasePriceIdx,
            $productsRatingIdx,
            $productsSalesCountIdx
        ) {
            if (!$productsStatusIdx) {
                $table->index('status', 'products_status_idx');
            }
            if (!$productsIsNewIdx) {
                $table->index('is_new', 'products_is_new_idx');
            }
            if (!$productsIsBestsellerIdx) {
                $table->index('is_bestseller', 'products_is_bestseller_idx');
            }
            if (!$productsIsFeaturedIdx) {
                $table->index('is_featured', 'products_is_featured_idx');
            }
            if (!$productsCreatedAtIdx) {
                $table->index('created_at', 'products_created_at_idx');
            }
            if (!$productsBasePriceIdx) {
                $table->index('base_price', 'products_base_price_idx');
            }
            if (!$productsRatingIdx) {
                $table->index('rating', 'products_rating_idx');
            }
            if (!$productsSalesCountIdx) {
                $table->index('sales_count', 'products_sales_count_idx');
            }
        });
    }

    public function down(): void
    {
        Schema::table('products', function (Blueprint $table) {
            $table->dropIndex('products_status_idx');
            $table->dropIndex('products_is_new_idx');
            $table->dropIndex('products_is_bestseller_idx');
            $table->dropIndex('products_is_featured_idx');
            $table->dropIndex('products_created_at_idx');
            $table->dropIndex('products_base_price_idx');
            $table->dropIndex('products_rating_idx');
            $table->dropIndex('products_sales_count_idx');
        });

        Schema::table('product_images', function (Blueprint $table) {
            $table->dropIndex('product_images_product_id_idx');
            $table->dropIndex('product_images_is_primary_idx');
            $table->dropIndex('product_images_product_primary_idx');
        });

        Schema::table('bangladeshi_areas', function (Blueprint $table) {
            $table->dropUnique('bangladeshi_areas_district_code_unique');
        });

        Schema::table('reviews', function (Blueprint $table) {
            $table->dropUnique('reviews_user_product_unique');
        });

        Schema::table('product_variants', function (Blueprint $table) {
            $table->dropUnique('product_variants_unique_variant');
        });
    }
};
