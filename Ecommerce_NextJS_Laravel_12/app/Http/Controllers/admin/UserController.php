<?php

namespace App\Http\Controllers\admin;

use App\Http\Controllers\Controller;
use App\Models\User;
use Illuminate\Http\Request;

class UserController extends Controller
{
    public function index(Request $request){
        $perPage = $request->input('per_page', 10);
        $page = $request->input('page', 1);
        
        $users = User::latest()->paginate($perPage, ['*'], 'page', $page);
        
        return response()->json([
            'status'=> 200,
            'success'=>'Users found successfully',
            'data'=>$users->items(),
            'pagination' => [
                'total' => $users->total(),
                'per_page' => $users->perPage(),
                'current_page' => $users->currentPage(),
                'last_page' => $users->lastPage(),
                'from' => $users->firstItem(),
                'to' => $users->lastItem(),
            ]
        ],200);
    }
}
