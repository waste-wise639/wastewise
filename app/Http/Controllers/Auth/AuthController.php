<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\User;
use Illuminate\Support\Facades\Hash;
use App\Http\Requests\RegisterRequest;
use App\Http\Requests\LoginRequest;

class AuthController extends Controller
{
    
      public function register(RegisterRequest $request) {

        $request->validated();

        $userData = [
            'name' => $request->name,
            'email' => $request->email,
            'password' => Hash::make($request->password),
        ];

        $user = User::create($userData);

        return response()->json([
            'user' => $user,
        ], 201);

    }

    // login
   public function login(LoginRequest $request) 
   {
    $user = User::where('email', $request->email)->first(); 

    if (!$user || !Hash::check($request->password, $user->password)) {
        return response()->json([
            'message' => 'Invalid credentials',
        ], 422);
    }

    $token = $user->createToken('auth-token')->plainTextToken;

    return response()->json([
        'user' => $user,
        'token' => $token
    ], 200);
    }

   public function user()
   {
    $user = auth()->user();

    if (!$user) {
        return response()->json([
            'message' => 'No user found',
        ], 404);
    }

    return response()->json([
        'user' => $user,
    ], 200);
    }

    public function logout(Request $request)
    {
    // $request->user()->currentAccessToken()->delete();
     $request->user()->tokens()->delete();

    return response()->json([
        'message' => 'Logged out successfully',
    ], 200);
    }

}
