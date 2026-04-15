<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Requests\WaitlistRequest;
use App\Models\VendorWaitlist;
use Illuminate\Support\Facades\Mail;
use App\Mail\WaitlistWelcomeMail;
use CloudinaryLabs\CloudinaryLaravel\Facades\Cloudinary;

class WaitlistController extends Controller
{
    public function store(WaitlistRequest $request)
    {
        $data = $request->validated();

        // ========================
        // FORMAT PHONE (Nigeria)
        // ========================
        if (str_starts_with($data['phone'], '0')) {
            $data['phone'] = '+234' . substr($data['phone'], 1);
        }

        // ========================
        // HANDLE FILE UPLOADS
        // ========================
        if ($request->hasFile('id_avatar')) {
            $data['id_avatar'] = Cloudinary::upload(
                $request->file('id_avatar')->getRealPath(),
                ['folder' => 'wastewise/id']
            )->getSecurePath();
        }

        if ($request->hasFile('business_upload_doc')) {
            $data['business_upload_doc'] = Cloudinary::upload(
                $request->file('business_upload_doc')->getRealPath(),
                ['folder' => 'wastewise/docs']
            )->getSecurePath();
        }

        // ========================
        // HANDLE ARRAYS
        // ========================
        if (isset($data['type_of_waste'])) {
            $data['type_of_waste'] = json_encode($data['type_of_waste']);
        }

        // ========================
        // LOGIC FIXES
        // ========================
        if (!$data['collection_vehicle']) {
            $data['number_of_collection_vehicle'] = 0;
        }

        // ========================
        // SAVE
        // ========================
        $vendor = VendorWaitlist::create($data);

        // ========================
        // SEND EMAIL (QUEUE READY)
        // ========================
        Mail::to($vendor->email)->send(new WaitlistWelcomeMail($vendor));

        return response()->json([
            'success' => true,
            'message' => 'Vendor added to the waitlist successfully.',
            'vendor'  => $vendor
        ], 201);
    }

    public function index()
    {
        $vendors = VendorWaitlist::latest()->get();

        return response()->json([
            'success' => true,
            'vendors' => $vendors
        ]);
    }
}