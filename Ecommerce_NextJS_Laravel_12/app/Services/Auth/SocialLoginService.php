<?php

namespace App\Services\Auth;

use Illuminate\Support\Facades\Http;
use Exception;

/**
 * Social Login Service
 * 
 * Handles OAuth authentication with Google, Facebook, GitHub
 * Manages user account linking and profile synchronization
 */
class SocialLoginService
{
    /**
     * Get Google OAuth URL
     */
    public static function getGoogleAuthUrl(): array
    {
        try {
            $clientId = config('services.google.client_id');
            $redirectUri = config('services.google.redirect_uri');
            $scope = 'openid email profile';
            $state = \Str::random(40);

            // Store state in session for CSRF protection
            session(['oauth_state' => $state]);

            $authUrl = "https://accounts.google.com/o/oauth2/v2/auth?" . http_build_query([
                'client_id' => $clientId,
                'redirect_uri' => $redirectUri,
                'response_type' => 'code',
                'scope' => $scope,
                'state' => $state,
                'access_type' => 'offline',
                'prompt' => 'consent',
            ]);

            return [
                'success' => true,
                'auth_url' => $authUrl,
            ];
        } catch (Exception $e) {
            \Log::error('Google OAuth URL Error: ' . $e->getMessage());
            return [
                'success' => false,
                'message' => 'Failed to generate Google OAuth URL',
                'error' => $e->getMessage(),
            ];
        }
    }

    /**
     * Handle Google Callback
     */
    public static function handleGoogleCallback(string $code, ?string $state = null): array
    {
        try {
            $clientId = config('services.google.client_id');
            $clientSecret = config('services.google.client_secret');
            $redirectUri = config('services.google.redirect_uri');

            // Get access token
            $response = Http::post('https://oauth2.googleapis.com/token', [
                'client_id' => $clientId,
                'client_secret' => $clientSecret,
                'code' => $code,
                'grant_type' => 'authorization_code',
                'redirect_uri' => $redirectUri,
            ]);

            if (!$response->successful()) {
                throw new Exception('Failed to get access token: ' . $response->body());
            }

            $token = $response->json('access_token');

            // Get user info
            $userResponse = Http::withToken($token)->get('https://www.googleapis.com/oauth2/v1/userinfo');

            if (!$userResponse->successful()) {
                throw new Exception('Failed to get user info');
            }

            $userData = $userResponse->json();

            // Find or create user
            $user = \App\Models\User::firstOrCreate(
                ['email' => $userData['email']],
                [
                    'name' => $userData['name'],
                    'password' => \Hash::make(\Str::random(32)),
                    'role' => 'customer',
                ]
            );

            // Generate token
            $authToken = $user->createToken('auth_token')->plainTextToken;

            return [
                'success' => true,
                'provider' => 'google',
                'user' => $user->toArray(),
                'token' => $authToken,
                'provider_data' => [
                    'provider_id' => $userData['id'],
                    'avatar' => $userData['picture'] ?? null,
                ],
            ];
        } catch (Exception $e) {
            \Log::error('Google OAuth Error: ' . $e->getMessage());
            return [
                'success' => false,
                'error' => $e->getMessage(),
                'message' => 'Failed to authenticate with Google',
            ];
        }
    }

    /**
     * Get Facebook OAuth URL
     */
    public static function getFacebookAuthUrl(): array
    {
        try {
            $appId = config('services.facebook.client_id');
            $redirectUri = config('services.facebook.redirect_uri');
            $scope = 'email public_profile';
            $state = \Str::random(40);

            session(['oauth_state' => $state]);

            $url = "https://www.facebook.com/v18.0/dialog/oauth?" . http_build_query([
                'client_id' => $appId,
                'redirect_uri' => $redirectUri,
                'scope' => $scope,
                'state' => $state,
            ]);

            return [
                'success' => true,
                'auth_url' => $url,
            ];
        } catch (Exception $e) {
            \Log::error('Facebook OAuth URL Error: ' . $e->getMessage());
            return [
                'success' => false,
                'error' => $e->getMessage(),
                'message' => 'Failed to generate Facebook OAuth URL',
            ];
        }
    }

    /**
     * Handle Facebook Callback
     */
    public static function handleFacebookCallback(string $code, ?string $state = null): array
    {
        try {
            $appId = config('services.facebook.client_id');
            $appSecret = config('services.facebook.client_secret');
            $redirectUri = config('services.facebook.redirect_uri');

            // Get access token
            $response = Http::get('https://graph.facebook.com/v18.0/oauth/access_token', [
                'client_id' => $appId,
                'client_secret' => $appSecret,
                'redirect_uri' => $redirectUri,
                'code' => $code,
            ]);

            if (!$response->successful()) {
                throw new Exception('Failed to get access token: ' . $response->body());
            }

            $token = $response->json('access_token');

            // Get user info
            $userResponse = Http::withToken($token)->get('https://graph.facebook.com/v18.0/me', [
                'fields' => 'id,name,email,picture.type(large)',
            ]);

            if (!$userResponse->successful()) {
                throw new Exception('Failed to get user info');
            }

            $userData = $userResponse->json();

            // Find or create user
            $user = \App\Models\User::firstOrCreate(
                ['email' => $userData['email']],
                [
                    'name' => $userData['name'],
                    'password' => \Hash::make(\Str::random(32)),
                    'role' => 'customer',
                ]
            );

            // Generate token
            $authToken = $user->createToken('auth_token')->plainTextToken;

            return [
                'success' => true,
                'provider' => 'facebook',
                'user' => $user->toArray(),
                'token' => $authToken,
                'provider_data' => [
                    'provider_id' => $userData['id'],
                    'avatar' => $userData['picture']['data']['url'] ?? null,
                ],
            ];
        } catch (Exception $e) {
            \Log::error('Facebook OAuth Error: ' . $e->getMessage());
            return [
                'success' => false,
                'error' => $e->getMessage(),
                'message' => 'Failed to authenticate with Facebook',
            ];
        }
    }

    /**
     * Get GitHub OAuth URL
     */
    public static function getGithubAuthUrl(): array
    {
        try {
            $clientId = config('services.github.client_id');
            $redirectUri = config('services.github.redirect_uri');
            $scope = 'user:email';
            $state = \Str::random(40);

            session(['oauth_state' => $state]);

            $url = "https://github.com/login/oauth/authorize?" . http_build_query([
                'client_id' => $clientId,
                'redirect_uri' => $redirectUri,
                'scope' => $scope,
                'state' => $state,
            ]);

            return [
                'success' => true,
                'auth_url' => $url,
            ];
        } catch (Exception $e) {
            \Log::error('GitHub OAuth URL Error: ' . $e->getMessage());
            return [
                'success' => false,
                'error' => $e->getMessage(),
                'message' => 'Failed to generate GitHub OAuth URL',
            ];
        }
    }

    /**
     * Handle GitHub Callback
     */
    public static function handleGithubCallback(string $code, ?string $state = null): array
    {
        try {
            $clientId = config('services.github.client_id');
            $clientSecret = config('services.github.client_secret');
            $redirectUri = config('services.github.redirect_uri');

            // Get access token
            $response = Http::withHeaders(['Accept' => 'application/json'])
                ->post('https://github.com/login/oauth/access_token', [
                    'client_id' => $clientId,
                    'client_secret' => $clientSecret,
                    'code' => $code,
                    'redirect_uri' => $redirectUri,
                ]);

            if (!$response->successful()) {
                throw new Exception('Failed to get access token: ' . $response->body());
            }

            $token = $response->json('access_token');

            // Get user info
            $userResponse = Http::withToken($token)
                ->withHeaders(['Accept' => 'application/vnd.github.v3+json'])
                ->get('https://api.github.com/user');

            if (!$userResponse->successful()) {
                throw new Exception('Failed to get user info');
            }

            $userData = $userResponse->json();

            // GitHub may not provide public email, fetch it separately
            if (empty($userData['email'])) {
                $emailResponse = Http::withToken($token)
                    ->withHeaders(['Accept' => 'application/vnd.github.v3+json'])
                    ->get('https://api.github.com/user/emails');
                
                $emails = $emailResponse->json();
                $primaryEmail = collect($emails)->firstWhere('primary', true);
                $userData['email'] = $primaryEmail['email'] ?? null;
            }

            if (empty($userData['email'])) {
                throw new Exception('No email address available from GitHub account');
            }

            // Find or create user
            $user = \App\Models\User::firstOrCreate(
                ['email' => $userData['email']],
                [
                    'name' => $userData['name'] ?? $userData['login'],
                    'password' => \Hash::make(\Str::random(32)),
                    'role' => 'customer',
                ]
            );

            // Generate token
            $authToken = $user->createToken('auth_token')->plainTextToken;

            return [
                'success' => true,
                'provider' => 'github',
                'user' => $user->toArray(),
                'token' => $authToken,
                'provider_data' => [
                    'provider_id' => $userData['id'],
                    'avatar' => $userData['avatar_url'] ?? null,
                ],
            ];
        } catch (Exception $e) {
            \Log::error('GitHub OAuth Error: ' . $e->getMessage());
            return [
                'success' => false,
                'error' => $e->getMessage(),
                'message' => 'Failed to authenticate with GitHub',
            ];
        }
    }

    /**
     * Find or Create User from Social Data
     */
    public static function findOrCreateUser(array $socialData): array
    {
        try {
            $user = \App\Models\User::where('email', $socialData['email'])->first();

            if ($user) {
                // Update social login info
                $user->update([
                    'social_provider' => $socialData['provider'],
                    'social_provider_id' => $socialData['provider_id'],
                ]);
            } else {
                // Create new user
                $user = \App\Models\User::create([
                    'name' => $socialData['name'],
                    'email' => $socialData['email'],
                    'password' => bcrypt(\Str::random(16)),
                    'social_provider' => $socialData['provider'],
                    'social_provider_id' => $socialData['provider_id'],
                    'email_verified_at' => now(),
                    'role' => 'customer',
                ]);
            }

            return [
                'success' => true,
                'user' => $user,
                'token' => $user->createToken('auth-token')->plainTextToken,
            ];
        } catch (Exception $e) {
            \Log::error('Find or Create User Error: ' . $e->getMessage());
            return [
                'success' => false,
                'error' => $e->getMessage(),
            ];
        }
    }

    /**
     * Link Social Account to Existing User
     */
    public static function linkSocialAccount(\App\Models\User $user, array $socialData): array
    {
        try {
            $user->update([
                'social_provider' => $socialData['provider'],
                'social_provider_id' => $socialData['provider_id'],
            ]);

            return [
                'success' => true,
                'message' => 'Social account linked successfully',
            ];
        } catch (Exception $e) {
            \Log::error('Link Social Account Error: ' . $e->getMessage());
            return [
                'success' => false,
                'error' => $e->getMessage(),
            ];
        }
    }

    /**
     * Unlink Social Account
     */
    public static function unlinkSocialAccount(\App\Models\User $user): array
    {
        try {
            $user->update([
                'social_provider' => null,
                'social_provider_id' => null,
            ]);

            return [
                'success' => true,
                'message' => 'Social account unlinked',
            ];
        } catch (Exception $e) {
            \Log::error('Unlink Social Account Error: ' . $e->getMessage());
            return [
                'success' => false,
                'error' => $e->getMessage(),
            ];
        }
    }
}
