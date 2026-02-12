<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Add phone and additional fields to users table
     */
    public function up(): void
    {
        Schema::table('users', function (Blueprint $table) {
            $table->string('phone', 20)->nullable()->unique()->after('email');
            $table->string('profile_image')->nullable()->after('phone');
            $table->text('address')->nullable()->after('profile_image');
            $table->string('city', 100)->nullable()->after('address');
            $table->string('district', 100)->nullable()->after('city');
            $table->string('postal_code', 20)->nullable()->after('district');
            $table->string('country', 100)->default('Bangladesh')->after('postal_code');
            $table->date('date_of_birth')->nullable()->after('country');
            $table->enum('gender', ['male', 'female', 'other'])->nullable()->after('date_of_birth');
            $table->text('notes')->nullable()->after('gender');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('users', function (Blueprint $table) {
            $table->dropColumn([
                'phone',
                'profile_image',
                'address',
                'city',
                'district',
                'postal_code',
                'country',
                'date_of_birth',
                'gender',
                'notes'
            ]);
        });
    }
};
