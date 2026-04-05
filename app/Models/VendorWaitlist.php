<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class VendorWaitlist extends Model
{

  protected $connection = 'pgsql_waitlist';

   // ✅ explicitly set table name
    protected $table = 'vendors_waitlist';

   protected $fillable = [
        'company_name',
        'email',
        'phone',
        'operational_state',
        'operational_city',
        'office_address',
        'registration_number',
        'number_of_trucks',
        'number_of_drivers',
        'status',
        // ✅ NEW
        'registrant_name',
        'registrant_email',
        'registrant_phone',
        'registrant_position',
    ];
    
}
