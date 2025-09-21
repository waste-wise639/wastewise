<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\User;
use Illuminate\Support\Facades\Hash;
use App\Http\Requests\RegisterRequest;
use App\Http\Requests\LoginRequest;
use Illuminate\Support\Facades\Password;
use Illuminate\Validation\ValidationException;

class AuthController extends Controller
{
    //register
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

   //get user
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

    //logout
    public function logout(Request $request)
    {
    // $request->user()->currentAccessToken()->delete();
     $request->user()->tokens()->delete();

    return response()->json([
        'message' => 'Logged out successfully',
    ], 200);
    }

    // Send reset link
    public function forgotPassword(Request $request)
    {
        $request->validate([
            'email' => 'required|email|exists:users,email',
        ]);

        $status = Password::sendResetLink(
            $request->only('email')
        );

        if ($status === Password::RESET_LINK_SENT) {
            return response()->json([
                'message' => __($status),
            ], 200);
        }

        return response()->json([
            'message' => __($status),
        ], 400);
    }

     // Handle reset password
    public function resetPassword(Request $request)
    {
        $request->validate([
            'token'    => 'required',
            'email'    => 'required|email|exists:users,email',
            'password' => 'required|min:6|confirmed',
        ]);

        $status = Password::reset(
            $request->only('email', 'password', 'password_confirmation', 'token'),
            function ($user, $password) {
                $user->forceFill([
                    'password' => Hash::make($password),
                ])->save();

                // optional: delete all tokens so user is logged out everywhere
                $user->tokens()->delete();
            }
        );

        if ($status === Password::PASSWORD_RESET) {
            return response()->json([
                'message' => __($status),
            ], 200);
        }

        throw ValidationException::withMessages([
            'email' => [__($status)],
        ]);
    }  

}
