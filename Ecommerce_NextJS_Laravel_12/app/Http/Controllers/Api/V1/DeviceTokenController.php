<?php

namespace App\Http\Controllers\Api\V1;

use App\Models\UserDeviceToken;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class DeviceTokenController extends ApiController
{
    public function register(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'token' => 'required|string|max:512',
            'platform' => 'required|string|in:ios,android,web',
            'device_name' => 'nullable|string|max:100',
        ]);

        if ($validator->fails()) {
            return $this->error('Validation failed', 422, 'validation_error', $validator->errors()->toArray());
        }

        $data = $validator->validated();

        $deviceToken = UserDeviceToken::updateOrCreate(
            ['token' => $data['token']],
            [
                'user_id' => $request->user()->id,
                'platform' => $data['platform'],
                'device_name' => $data['device_name'] ?? null,
                'last_used_at' => now(),
            ]
        );

        return $this->success($deviceToken, 'Device token registered', 201);
    }

    public function unregister(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'token' => 'required|string|max:512',
        ]);

        if ($validator->fails()) {
            return $this->error('Validation failed', 422, 'validation_error', $validator->errors()->toArray());
        }

        UserDeviceToken::where('token', $request->token)
            ->where('user_id', $request->user()->id)
            ->delete();

        return $this->success(null, 'Device token unregistered');
    }
}
