<?php

namespace App\Http\Controllers;

use App\Models\Newsletter;
use Illuminate\Http\Request;

class NewsletterController extends Controller
{
    public function subscribe(Request $request)
    {
        $validated = $request->validate([
            'email' => 'required|email|unique:newsletters,email',
        ]);

        $newsletter = Newsletter::create([
            'email' => $validated['email'],
            'subscribed_at' => now(),
        ]);

        return response()->json([
            'data' => $newsletter,
            'status' => 201,
            'message' => 'Successfully subscribed to newsletter',
        ], 201);
    }

    public function unsubscribe(Request $request)
    {
        $validated = $request->validate([
            'email' => 'required|email|exists:newsletters,email',
        ]);

        $newsletter = Newsletter::where('email', $validated['email'])->firstOrFail();
        $newsletter->update(['unsubscribed_at' => now()]);

        return response()->json([
            'status' => 200,
            'message' => 'Successfully unsubscribed from newsletter',
        ], 200);
    }
}
