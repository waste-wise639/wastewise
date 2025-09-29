<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Auth\AuthController;
use App\Http\Controllers\LocationController;
use Illuminate\Foundation\Auth\EmailVerificationRequest;


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
