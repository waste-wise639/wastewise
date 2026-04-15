<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Requests\WaitlistRequest;
use App\Models\VendorWaitlist;
use Illuminate\Support\Facades\Mail;
use App\Mail\WaitlistWelcomeMail;
use Cloudinary\Cloudinary;

class WaitlistController extends Controller
{
    private $cloudinary;
    
    public function __construct()
    {
        // Initialize Cloudinary in constructor when needed, not at bootstrap
        $this->cloudinary = new Cloudinary([
            'cloud' => [
                'cloud_name' => env('CLOUDINARY_CLOUD_NAME'),
                'api_key'    => env('CLOUDINARY_API_KEY'),
                'api_secret' => env('CLOUDINARY_API_SECRET'),
            ],
            'url' => [
                'secure' => true
            ]
        ]);
    }
    
    public function store(WaitlistRequest $request)
    {
        $data = $request->validated();

        // FORMAT PHONE (Nigeria)
        if (str_starts_with($data['phone'], '0')) {
            $data['phone'] = '+234' . substr($data['phone'], 1);
        }

        // HANDLE FILE UPLOADS
        if ($request->hasFile('id_avatar')) {
            try {
                $upload = $this->cloudinary->uploadApi()->upload(
                    $request->file('id_avatar')->getRealPath(),
                    ['folder' => 'wastewise/id']
                );
                $data['id_avatar'] = $upload['secure_url'];
            } catch (\Exception $e) {
                return response()->json([
                    'success' => false,
                    'message' => 'Avatar upload failed: ' . $e->getMessage()
                ], 500);
            }
        }

        if ($request->hasFile('business_upload_doc')) {
            try {
                $upload = $this->cloudinary->uploadApi()->upload(
                    $request->file('business_upload_doc')->getRealPath(),
                    ['folder' => 'wastewise/docs']
                );
                $data['business_upload_doc'] = $upload['secure_url'];
            } catch (\Exception $e) {
                return response()->json([
                    'success' => false,
                    'message' => 'Document upload failed: ' . $e->getMessage()
                ], 500);
            }
        }

        // LOGIC FIXES
        if (!$data['collection_vehicle']) {
            $data['number_of_collection_vehicle'] = 0;
        }

        // SAVE
        $vendor = VendorWaitlist::create($data);

        // SEND EMAIL (QUEUE READY)
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