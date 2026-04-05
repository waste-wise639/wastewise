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
        Schema::table('vendors_waitlist', function (Blueprint $table) {
            $table->string('registrant_name')->after('company_name');
            $table->string('registrant_email')->after('email');
            $table->string('registrant_phone')->after('phone');
            $table->string('registrant_position')->after('registrant_phone');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('vendors_waitlist', function (Blueprint $table) {
            $table->dropColumn([
                'registrant_name',
                'registrant_email',
                'registrant_phone',
                'registrant_position'
            ]);
        });
    }
};
