<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Add state and billing_state columns to orders table
     */
    public function up(): void
    {
        Schema::table('orders', function (Blueprint $table) {
            // Add state column if it doesn't exist
            if (!Schema::hasColumn('orders', 'state')) {
                $table->string('state', 100)->nullable()->after('postal_code');
            }
            
            // Add billing_state column if it doesn't exist
            if (!Schema::hasColumn('orders', 'billing_state')) {
                $table->string('billing_state', 100)->nullable()->after('billing_postal_code');
            }
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('orders', function (Blueprint $table) {
            if (Schema::hasColumn('orders', 'state')) {
                $table->dropColumn('state');
            }
            if (Schema::hasColumn('orders', 'billing_state')) {
                $table->dropColumn('billing_state');
            }
        });
    }
};
