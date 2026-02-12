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
        Schema::create('user_sessions', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('user_id');
            $table->unsignedBigInteger('token_id')->nullable(); // Reference to personal_access_tokens
            $table->string('device')->nullable(); // iPhone 15, Windows PC, etc
            $table->string('browser')->nullable(); // Chrome, Safari, Firefox
            $table->string('browser_version')->nullable();
            $table->string('os')->nullable(); // iOS, Windows, Linux
            $table->string('os_version')->nullable();
            $table->string('ip_address')->nullable();
            $table->string('location')->nullable(); // City, Country
            $table->decimal('latitude', 10, 8)->nullable();
            $table->decimal('longitude', 11, 8)->nullable();
            $table->timestamp('last_activity')->nullable();
            $table->timestamp('logged_in_at');
            $table->timestamp('expires_at')->nullable();
            $table->boolean('is_current')->default(false);
            $table->string('user_agent')->nullable();
            $table->timestamps();
            
            $table->foreign('user_id')->references('id')->on('users')->onDelete('cascade');
            $table->index(['user_id', 'last_activity']);
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('user_sessions');
    }
};
