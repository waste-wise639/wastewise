<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Validation\Rule;

class WaitlistRequest extends FormRequest
{
    public function authorize(): bool
    {
        return true;
    }

    public function rules(): array
    {
       return [
        'company_name' => ['required', 'string', 'max:255'],

        'email' => [
            'required',
            'email',
            Rule::unique('pgsql_waitlist.vendors_waitlist', 'email'),
        ],

        'phone' => [
            'required',
            'regex:/^(?:\+234|0)[789][01]\d{8}$/'
        ],

        'operational_state' => ['required', 'string', 'max:255'],
        'operational_city' => ['required', 'string', 'max:255'],

        'office_address' => ['required', 'string'],

        'registration_number' => [
            'required',
            'string',
            Rule::unique('pgsql_waitlist.vendors_waitlist', 'registration_number'),
        ],

        'number_of_trucks' => ['nullable', 'integer', 'min:0'],
        'number_of_drivers' => ['nullable', 'integer', 'min:0'],

         // ✅ NEW FIELDS
        'registrant_name' => ['required', 'string', 'max:255'],
        'registrant_email' => ['required', 'email', 'max:255'],
        'registrant_phone' => [
            'required',
            'regex:/^(?:\+234|0)[789][01]\d{8}$/'
        ],
        'registrant_position' => ['nullable', 'string', 'max:255'], // we'll default this
    ];
    }
}