<?php

use Illuminate\Foundation\Application;
use Illuminate\Foundation\Configuration\Exceptions;
use Illuminate\Foundation\Configuration\Middleware;

return Application::configure(basePath: dirname(__DIR__))
    ->withRouting(
        web: __DIR__.'/../routes/web.php',
        api: __DIR__.'/../routes/api.php',
        commands: __DIR__.'/../routes/console.php',
        health: '/up',
    )
    ->withMiddleware(function (Middleware $middleware): void {
        $middleware->statefulApi();
        $middleware->throttleApi('api');
        $middleware->validateCsrfTokens(except: [
            'api/*'
        ]);

        \Illuminate\Auth\Middleware\Authenticate::redirectUsing(function ($request) {
            if ($request->is('api/*')) {
                return null;
            }
            return '/admin/login';
        });
    })
    ->withExceptions(function (Exceptions $exceptions): void {
        // Handle unauthenticated and validation requests for API
        $exceptions->respond(function ($response, $exception, $request) {
            if ($request->is('api/*')) {
                if ($exception instanceof \Illuminate\Auth\AuthenticationException) {
                    return response()->json([
                        'success' => false,
                        'message' => 'Unauthenticated. Please login first.',
                        'error_code' => 'authentication_required',
                        'errors' => [],
                    ], 401);
                }

                if ($exception instanceof \Illuminate\Validation\ValidationException) {
                    return response()->json([
                        'success' => false,
                        'message' => 'Validation failed',
                        'error_code' => 'validation_error',
                        'errors' => $exception->errors(),
                    ], 422);
                }
            }
            return $response;
        });
    })->create();
