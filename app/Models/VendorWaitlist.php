<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class VendorWaitlist extends Model
{
    protected $connection = 'pgsql_waitlist';

    protected $table = 'vendors_waitlist';

    protected $fillable = [

        // ========================
        // PERSONAL INFO
        // ========================
        'fullname',
        'email',
        'phone',
        'business_name',
        'business_type',
        'country',
        'state',
        'lga',
        'referral_code',

        // ========================
        // BUSINESS DETAILS
        // ========================
        'business_reg_status',
        'cac_number',
        'years_of_experience',
        'number_of_drivers',
        'operation_coverage_area',

        'id_avatar',
        'business_upload_doc',

        // ========================
        // OPERATIONS
        // ========================
        'type_of_waste',
        'collection_vehicle',
        'number_of_collection_vehicle',
        'capacity',
        'availability',

        // ========================
        // BANKING
        // ========================
        'bank_name',
        'account_number',
        'account_name',
        'preferred_payment_mode',

        // ========================
        // AGREEMENT
        // ========================
        'agree_to_terms_and_conditions',

        // ========================
        // STATUS
        // ========================
        'status',
    ];

    // ========================
    // CASTS (VERY IMPORTANT)
    // ========================
    protected $casts = [
        'collection_vehicle' => 'boolean',
        'agree_to_terms_and_conditions' => 'boolean',
        'years_of_experience' => 'integer',
        'number_of_drivers' => 'integer',
        'number_of_collection_vehicle' => 'integer',
    ];
}