<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Create bangladeshi_locations table for divisions, districts, and areas
     */
    public function up(): void
    {
        Schema::create('bangladeshi_divisions', function (Blueprint $table) {
            $table->id();
            $table->string('name', 100)->unique();
            $table->string('code', 10)->unique();
            $table->text('description')->nullable();
            $table->boolean('is_active')->default(true);
            $table->timestamps();
        });

        Schema::create('bangladeshi_districts', function (Blueprint $table) {
            $table->id();
            $table->foreignId('division_id')->constrained('bangladeshi_divisions')->onDelete('cascade');
            $table->string('name', 100);
            $table->string('code', 10);
            $table->text('description')->nullable();
            $table->boolean('is_active')->default(true);
            $table->timestamps();
            
            $table->unique(['division_id', 'code']);
            $table->index('division_id');
        });

        Schema::create('bangladeshi_areas', function (Blueprint $table) {
            $table->id();
            $table->foreignId('district_id')->constrained('bangladeshi_districts')->onDelete('cascade');
            $table->string('name', 100);
            $table->string('thana_name', 100)->nullable();
            $table->string('code', 20);
            $table->text('description')->nullable();
            $table->decimal('delivery_charge_base', 8, 2)->nullable();
            $table->boolean('is_active')->default(true);
            $table->timestamps();
            
            $table->index('district_id');
            $table->index('is_active');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('bangladeshi_areas');
        Schema::dropIfExists('bangladeshi_districts');
        Schema::dropIfExists('bangladeshi_divisions');
    }
};
