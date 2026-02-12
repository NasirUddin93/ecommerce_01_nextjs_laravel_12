<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Support\Facades\Schema;
use Illuminate\Support\Facades\DB;

return new class extends Migration
{
    /**
     * Align payment method enums across orders, payments, transactions
     */
    public function up(): void
    {
        $enum = "ENUM('cod','bkash','nagad','rocket','card','bank_transfer','mobile_banking','wallet')";

        if (Schema::hasColumn('payments', 'payment_method')) {
            DB::table('payments')->where('payment_method', 'COD')->update(['payment_method' => 'cod']);
        }

        if (Schema::hasColumn('transactions', 'method')) {
            DB::table('transactions')->where('method', 'COD')->update(['method' => 'cod']);
        }

        if (Schema::hasColumn('orders', 'payment_method')) {
            DB::statement("ALTER TABLE orders MODIFY payment_method $enum DEFAULT 'cod'");
        }

        if (Schema::hasColumn('payments', 'payment_method')) {
            DB::statement("ALTER TABLE payments MODIFY payment_method $enum");
        }

        if (Schema::hasColumn('transactions', 'method')) {
            DB::statement("ALTER TABLE transactions MODIFY method $enum");
        }
    }

    public function down(): void
    {
        // No safe rollback because previous enum values varied across environments.
        // Leave as-is to avoid breaking existing data.
    }
};
