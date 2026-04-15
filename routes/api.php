<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Auth\AuthController;
use App\Http\Controllers\LocationController;
use Illuminate\Foundation\Auth\EmailVerificationRequest;
use App\Http\Controllers\WaitlistController;


Route::post('register', [AuthController::class, 'register']);
Route::post('login', [AuthController::class, 'login']);

Route::post('/forgot-password', [AuthController::class, 'forgotPassword']);
Route::post('/reset-password', [AuthController::class, 'resetPassword'])->name('password.reset');

//country, state, city routes
Route::get('/countries', [LocationController::class, 'countries']);
Route::get('/states/{country}', [LocationController::class, 'states']);
Route::get('/cities/{state}', [LocationController::class, 'cities']);

Route::middleware('auth:sanctum')->group(function () {
    Route::get('/user', [AuthController::class, 'user']);
    Route::post('/logout', [AuthController::class, 'logout']);
});

//waitlist routes
Route::post('/joinwaitlist', [WaitlistController::class, 'store'])->name('joinwaitlist');
Route::get('/waitlist', [WaitlistController::class, 'index'])->name('waitlist.index');

// Add to routes/api.php
Route::get('/test-cloudinary', function() {
    try {
        // Check if env variables are loading
        $cloudUrl = env('CLOUDINARY_URL');
        $cloudName = env('CLOUDINARY_CLOUD_NAME');
        $apiKey = env('CLOUDINARY_API_KEY');
        
        \Log::info('Cloudinary Config Check', [
            'cloud_url_exists' => !empty($cloudUrl),
            'cloud_name' => $cloudName,
            'api_key_exists' => !empty($apiKey),
        ]);
        
        // Try to initialize Cloudinary
        $config = config('cloudinary');
        
        return response()->json([
            'config_loaded' => true,
            'cloud_url_configured' => !empty($config['cloud_url']),
            'cloud_name_from_env' => $cloudName,
        ]);
    } catch (\Exception $e) {
        return response()->json([
            'error' => $e->getMessage(),
            'line' => $e->getLine(),
        ], 500);
    }
});