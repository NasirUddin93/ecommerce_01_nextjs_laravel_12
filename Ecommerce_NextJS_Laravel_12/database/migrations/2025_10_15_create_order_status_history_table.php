<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Create order_status_history table for tracking order status changes
     */
    public function up(): void
    {
        Schema::create('order_status_history', function (Blueprint $table) {
            $table->id();
            $table->foreignId('order_id')->constrained('orders')->onDelete('cascade');
            
            // Status information
            $table->string('old_status', 50)->nullable();
            $table->string('new_status', 50);
            $table->text('remarks')->nullable();
            
            // Metadata
            $table->string('changed_by', 255)->nullable(); // Admin or system
            $table->string('change_source', 100)->nullable(); // 'manual', 'api', 'system'
            
            // Timestamps
            $table->timestamp('created_at')->useCurrent();
            
            // Indexes
            $table->index(['order_id', 'created_at']);
            $table->index('new_status');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('order_status_history');
    }
};
