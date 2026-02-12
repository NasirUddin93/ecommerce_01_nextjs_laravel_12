<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Update payments table with more detailed fields
     */
    public function up(): void
    {
        Schema::table('payments', function (Blueprint $table) {
            // Add payment gateway response fields
            $table->string('payment_gateway', 100)->nullable()->after('payment_method');
            $table->string('payment_phone_number', 20)->nullable()->after('payment_gateway');
            $table->string('payment_reference', 255)->nullable()->unique()->after('transaction_id');
            $table->timestamp('paid_at')->nullable()->after('status');
            
            // Refund fields
            $table->enum('refund_status', ['none', 'pending', 'completed', 'failed'])->default('none')->after('paid_at');
            $table->decimal('refund_amount', 10, 2)->nullable()->after('refund_status');
            $table->timestamp('refunded_at')->nullable()->after('refund_amount');
            
            // Response data
            $table->longText('payment_response')->nullable()->after('refunded_at');
            $table->text('payment_notes')->nullable()->after('payment_response');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('payments', function (Blueprint $table) {
            $table->dropColumn([
                'payment_gateway',
                'payment_phone_number',
                'payment_reference',
                'paid_at',
                'refund_status',
                'refund_amount',
                'refunded_at',
                'payment_response',
                'payment_notes'
            ]);
        });
    }
};
