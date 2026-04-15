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

        // ========================
        // PERSONAL INFO
        // ========================
        'fullname' => ['required', 'string', 'max:255'],

        'email' => [
            'required',
            'email',
            Rule::unique('pgsql_waitlist.vendors_waitlist', 'email'),
        ],

        'phone' => [
            'required',
            'regex:/^(?:\+234|0)[789][01]\d{8}$/'
        ],

        'business_name' => ['required', 'string', 'max:255'],
        'business_type' => ['required', 'string', 'max:255'],

        'country' => ['required', 'string'],
        'state' => ['required', 'string'],
        'lga' => ['required', 'string'],

        'referral_code' => ['nullable', 'string'],


        // ========================
        // BUSINESS DETAILS
        // ========================
        'business_reg_status' => ['required', 'string'],

        'cac_number' => [
            'nullable',
            'string',
            Rule::unique('pgsql_waitlist.vendors_waitlist', 'cac_number'),
        ],

        'years_of_experience' => ['required', 'integer', 'min:0'],

        'number_of_drivers' => ['required', 'integer', 'min:0'],

        'operation_coverage_area' => ['required', 'string'],

        // FILES
        'id_avatar' => ['required', 'file', 'mimes:jpg,jpeg,png,pdf', 'max:4096'],
        'business_upload_doc' => ['required', 'file', 'mimes:jpg,jpeg,png,pdf', 'max:4096'],


        // ========================
        // OPERATIONS
        // ========================
        'type_of_waste' => [
         'required',
         Rule::in(['solid', 'liquid', 'recyclable', 'hazardous', 'e-waste', 'organic'])
        ],

        'collection_vehicle' => ['required', 'boolean'],

        'number_of_collection_vehicle' => ['nullable', 'integer', 'min:0'],

        'capacity' => [
            'required',
            Rule::in(['daily', 'weekly', 'monthly'])
        ],

        'availability' => [
            'required',
            Rule::in(['full-time', 'part-time'])
        ],


        // ========================
        // BANKING
        // ========================
        'bank_name' => ['required', 'string'],
        'account_number' => ['required', 'string'],
        'account_name' => ['required', 'string'],

        'preferred_payment_mode' => ['required', 'string'],


        // ========================
        // AGREEMENT
        // ========================
        'agree_to_terms_and_conditions' => ['required', 'accepted'],
    ];
}
}