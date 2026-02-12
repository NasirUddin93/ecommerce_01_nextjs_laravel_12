<?php

namespace App\Http\Controllers;

use App\Models\User;
use App\Services\Auth\SocialLoginService;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;

class AuthController extends Controller
{
    protected $socialLoginService;

    public function __construct(SocialLoginService $socialLoginService)
    {
        $this->socialLoginService = $socialLoginService;
    }

    /**
     * Register a new user
     */
    public function register(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'name' => 'required|string|max:255',
            'email' => 'required|string|email|max:255|unique:users',
            'password' => 'required|string|min:8|confirmed',
            'role' => 'nullable|string|in:customer,admin'
        ]);

        if ($validator->fails()) {
            return response()->json([
                'success' => false,
                'message' => 'Validation failed',
                'errors' => $validator->errors()
            ], 422);
        }

        $user = User::create([
            'name' => $request->name,
            'email' => $request->email,
            'password' => Hash::make($request->password),
            'role' => $request->role ?? 'customer',
        ]);

        $token = $user->createToken('auth_token')->plainTextToken;

        return response()->json([
            'success' => true,
            'message' => 'User registered successfully',
            'user' => $user,
            'token' => $token,
        ], 201);
    }

    /**
     * Login user
     */
    public function login(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'email' => 'required|email',
            'password' => 'required',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'success' => false,
                'message' => 'Validation failed',
                'errors' => $validator->errors()
            ], 422);
        }

        $user = User::where('email', $request->email)->first();

        if (!$user || !Hash::check($request->password, $user->password)) {
            return response()->json([
                'success' => false,
                'message' => 'Invalid credentials'
            ], 401);
        }

        $token = $user->createToken('auth_token')->plainTextToken;

        return response()->json([
            'success' => true,
            'message' => 'Login successful',
            'user' => $user,
            'token' => $token,
        ]);
    }

    /**
     * Logout user
     */
    public function logout(Request $request)
    {
        $request->user()->currentAccessToken()->delete();

        return response()->json([
            'success' => true,
            'message' => 'Logged out successfully'
        ]);
    }

    /**
     * Google OAuth - Redirect
     */
    public function googleRedirect()
    {
        $result = $this->socialLoginService->getGoogleAuthUrl();

        if ($result['success']) {
            return redirect($result['auth_url']);
        }

        return response()->json($result, 500);
    }

    /**
     * Google OAuth - Callback
     */
    public function googleCallback(Request $request)
    {
        $result = $this->socialLoginService->handleGoogleCallback($request->code, $request->state);

        if ($result['success']) {
            // Redirect to frontend with token
            $frontendUrl = config('app.frontend_url', 'http://localhost:3000');
            return redirect("{$frontendUrl}/auth/callback?token={$result['token']}&email={$result['user']['email']}");
        }

        return redirect(config('app.frontend_url', 'http://localhost:3000') . '/login?error=oauth_failed');
    }

    /**
     * Facebook OAuth - Redirect
     */
    public function facebookRedirect()
    {
        $result = $this->socialLoginService->getFacebookAuthUrl();

        if ($result['success']) {
            return redirect($result['auth_url']);
        }

        return response()->json($result, 500);
    }

    /**
     * Facebook OAuth - Callback
     */
    public function facebookCallback(Request $request)
    {
        $result = $this->socialLoginService->handleFacebookCallback($request->code, $request->state);

        if ($result['success']) {
            $frontendUrl = config('app.frontend_url', 'http://localhost:3000');
            return redirect("{$frontendUrl}/auth/callback?token={$result['token']}&email={$result['user']['email']}");
        }

        return redirect(config('app.frontend_url', 'http://localhost:3000') . '/login?error=oauth_failed');
    }

    /**
     * GitHub OAuth - Redirect
     */
    public function githubRedirect()
    {
        $result = $this->socialLoginService->getGithubAuthUrl();

        if ($result['success']) {
            return redirect($result['auth_url']);
        }

        return response()->json($result, 500);
    }

    /**
     * GitHub OAuth - Callback
     */
    public function githubCallback(Request $request)
    {
        $result = $this->socialLoginService->handleGithubCallback($request->code, $request->state);

        if ($result['success']) {
            $frontendUrl = config('app.frontend_url', 'http://localhost:3000');
            return redirect("{$frontendUrl}/auth/callback?token={$result['token']}&email={$result['user']['email']}");
        }

        return redirect(config('app.frontend_url', 'http://localhost:3000') . '/login?error=oauth_failed');
    }
}
