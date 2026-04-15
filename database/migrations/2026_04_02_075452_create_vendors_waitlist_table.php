<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('vendors_waitlist', function (Blueprint $table) {

            $table->id();

            // ========================
            // PERSONAL INFO
            // ========================
            $table->string('fullname');
            $table->string('email')->unique();
            $table->string('phone');

            $table->string('business_name');
            $table->string('business_type');

            $table->string('country');
            $table->string('state');
            $table->string('lga');

            $table->string('referral_code')->nullable();

            // ========================
            // BUSINESS DETAILS
            // ========================
            $table->string('business_reg_status');
            $table->string('cac_number')->nullable()->unique();

            $table->integer('years_of_experience');
            $table->integer('number_of_drivers');

            $table->text('operation_coverage_area');

            // FILES
            $table->string('id_avatar')->nullable();
            $table->string('business_upload_doc')->nullable();

            // ========================
            // OPERATIONS
            // ========================
            $table->string('type_of_waste');

            $table->boolean('collection_vehicle');
            $table->integer('number_of_collection_vehicle')->default(0);

            $table->enum('capacity', ['daily', 'weekly', 'monthly']);
            $table->enum('availability', ['full-time', 'part-time']);

            // ========================
            // BANKING
            // ========================
            $table->string('bank_name');
            $table->string('account_number');
            $table->string('account_name');

            $table->string('preferred_payment_mode');

            // ========================
            // AGREEMENT
            // ========================
            $table->boolean('agree_to_terms_and_conditions');

            // ========================
            // STATUS
            // ========================
            $table->enum('status', ['pending', 'approved', 'rejected'])
                  ->default('pending');

            $table->timestamps();
        });
    }

    public function down(): void
    {
        Schema::connection('pgsql_waitlist')->dropIfExists('vendors_waitlist');
    }
};