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
        Schema::create('vendors_waitlist', function (Blueprint $table) {
            $table->id();
            $table->string('company_name');
            $table->string('email')->unique();
            $table->string('phone');
            $table->string('operational_state');
            $table->string('operational_city');
            $table->text('office_address');
            $table->string('registration_number')->unique();
            $table->unsignedInteger('number_of_trucks')->default(0);
            $table->unsignedInteger('number_of_drivers')->default(0);
            $table->enum('status', ['pilot_phase', 'active', 'inactive'])->default('pilot_phase');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('vendors_waitlist');
    }
};
