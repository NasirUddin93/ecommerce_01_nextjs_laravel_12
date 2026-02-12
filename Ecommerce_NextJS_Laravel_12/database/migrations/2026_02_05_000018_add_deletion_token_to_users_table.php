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
        Schema::table('users', function (Blueprint $table) {
            // Check if columns don't already exist to avoid duplicate column error
            if (!Schema::hasColumn('users', 'deletion_token')) {
                $table->string('deletion_token')->nullable()->unique()->after('is_active');
                $table->timestamp('deletion_requested_at')->nullable()->after('deletion_token');
            }
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('users', function (Blueprint $table) {
            if (Schema::hasColumn('users', 'deletion_token')) {
                $table->dropColumn('deletion_token');
            }
            if (Schema::hasColumn('users', 'deletion_requested_at')) {
                $table->dropColumn('deletion_requested_at');
            }
        });
    }
};
