<?php

namespace App\Http\Controllers\Api\V1;

use App\Http\Controllers\Controller;
use App\Http\Responses\ApiResponse;

class ApiController extends Controller
{
    protected function success(mixed $data = null, string $message = 'OK', int $status = 200, array $meta = [])
    {
        return ApiResponse::success($data, $message, $status, $meta);
    }

    protected function error(string $message, int $status = 400, string $errorCode = 'error', array $errors = [])
    {
        return ApiResponse::error($message, $status, $errorCode, $errors);
    }

    protected function paginated($paginator, string $message = 'OK')
    {
        return ApiResponse::paginated($paginator, $message);
    }
}
