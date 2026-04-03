<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Vendorwaitlist extends Model
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
        'status'
    ];

//     protected function prepareForValidation()
// {
//     if ($this->phone) {
//         $phone = $this->phone;

//         // Convert 080... → +23480...
//         if (str_starts_with($phone, '0')) {
//             $phone = '+234' . substr($phone, 1);
//         }

//         $this->merge([
//             'phone' => $phone
//         ]);
//     }
// }
 
}
