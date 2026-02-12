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
        Schema::create('settings', function (Blueprint $table) {
            $table->id();
            $table->string('key')->unique();
            $table->text('value')->nullable();
            $table->string('type')->default('string'); // string, integer, boolean, json, encrypted
            $table->string('group')->default('general'); // general, email, payment, shipping
            $table->text('description')->nullable();
            $table->boolean('is_encrypted')->default(false);
            $table->unsignedBigInteger('updated_by')->nullable();
            $table->integer('version')->default(1);
            $table->timestamps();
            
            $table->index(['key', 'group']);
            $table->foreign('updated_by')->references('id')->on('users')->onDelete('set null');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('settings');
    }
};
