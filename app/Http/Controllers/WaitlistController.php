<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Requests\WaitlistRequest;
use App\Models\VendorWaitlist;
use App\Jobs\ProcessWaitlistSubmission;


class WaitlistController extends Controller
{

public function store(WaitlistRequest $request)
    {
         $request->validated();

         $WaitlistData = [
            'company_name' => $request->company_name,
            'email' => $request->email,
            'phone' => $request->phone,
            'operational_state' => $request->operational_state,
            'operational_city' => $request->operational_city,
            'office_address' => $request->office_address,
            'registration_number' => $request->registration_number,
            'number_of_trucks' => $request->number_of_trucks,
            'number_of_drivers' => $request->number_of_drivers,
        ];

        // ✅ Format phone number: 08012345678 → +2348012345678
        if (str_starts_with($WaitlistData['phone'], '0')) {
            $WaitlistData['phone'] = '+234' . substr($WaitlistData['phone'], 1);
        }

        // ✅ Insert directly into the waitlist database
        $vendor = VendorWaitlist::create($WaitlistData);

        // ✅ Return JSON response
        return response()->json([
            'success' => true,
            'message' => 'Vendor added to the waitlist successfully.',
            'vendor'  => $vendor
        ], 201);
    }

    public function index()
    {
        $vendors = VendorWaitlist::all();

        return response()->json([
            'success' => true,
            'vendors' => $vendors
        ], 200);
    }

}

