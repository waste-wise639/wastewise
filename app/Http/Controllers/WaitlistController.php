<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Requests\WaitlistRequest;
use App\Models\VendorWaitlist;
use App\Jobs\ProcessWaitlistSubmission;
use Resend\Laravel\Facades\Resend;
use Illuminate\Support\Facades\Mail;
use App\Mail\WaitlistWelcomeMail;


class WaitlistController extends Controller
{

public function store(WaitlistRequest $request)
    {
       $data = $request->validated();

    // ✅ Format company phone
    if (str_starts_with($data['phone'], '0')) {
        $data['phone'] = '+234' . substr($data['phone'], 1);
    }

    // ✅ Format registrant phone
    if (str_starts_with($data['registrant_phone'], '0')) {
        $data['registrant_phone'] = '+234' . substr($data['registrant_phone'], 1);
    }

    // ✅ Default position if not provided
    $data['registrant_position'] = $data['registrant_position'] ?? 'admin';

    // ✅ Save
    $vendor = VendorWaitlist::create($data);

    // ✅ Send email
// Resend::emails()->send([
//     'from' => 'WasteWise Inc <team@danjicservices.com>',
//     'to' => [$vendor->email],
//     'subject' => 'You’re on the waitlist 🎉',
//     'html' => "
//         <h2>Hi {$vendor->registrant_name},</h2>
//         <p>Thanks for joining our vendor waitlist.</p>
//         <p>We’ll notify you when we launch 🚀</p>
//     ",
// ]);
Mail::to($vendor->email)->send(new WaitlistWelcomeMail($vendor));

    return response()->json([
        'success' => true,
        'message' => 'Vendor added to the waitlist successfully.',
        'vendor'  => $vendor
    ], 201);

    }

    public function index()
    {
        $vendors = VendorWaitlist::orderBy('created_at', 'desc')->get();

        return response()->json([
            'success' => true,
            'vendors' => $vendors
        ], 200);
    }

}

