<?php

namespace App\Http\Controllers;

use App\Models\Notification;
use Illuminate\Http\Request;

class NotificationController extends Controller
{
   public function index(Request $request)
    {
        $perPage = $request->input('per_page', 10);
        $page = $request->input('page', 1);
        
        $notifications = Notification::with('user')->latest()->paginate($perPage, ['*'], 'page', $page);

        return response()->json([
            'data' => $notifications->items(),
            'status' => 200,
            'message' => 'Notification list successfully retrieved',
            'pagination' => [
                'total' => $notifications->total(),
                'per_page' => $notifications->perPage(),
                'current_page' => $notifications->currentPage(),
                'last_page' => $notifications->lastPage(),
                'from' => $notifications->firstItem(),
                'to' => $notifications->lastItem(),
            ]
        ], 200);
    }

    public function store(Request $request)
    {
        $validated = $request->validate([
            'user_id' => 'required|exists:users,id',
            'message' => 'required|string',
            'status' => 'in:unread,read',
        ]);

        $notification = Notification::create($validated);

        return response()->json([
            'data' => $notification,
            'status' => 201,
            'message' => 'Notification successfully created',
        ], 201);
    }

    public function show($id)
    {
        $notification = Notification::with('user')->findOrFail($id);

        return response()->json([
            'data' => $notification,
            'status' => 200,
            'message' => 'Notification details found',
        ], 200);
    }

    public function update(Request $request, $id)
    {
        $notification = Notification::findOrFail($id);

        $validated = $request->validate([
            'message' => 'string',
            'status' => 'in:unread,read',
        ]);

        $notification->update($validated);

        return response()->json([
            'data' => $notification,
            'status' => 200,
            'message' => 'Notification successfully updated',
        ], 200);
    }

    public function destroy($id)
    {
        $notification = Notification::findOrFail($id);
        $notification->delete();

        return response()->json([
            'status' => 200,
            'message' => 'Notification successfully deleted',
        ], 200);
    }
}
