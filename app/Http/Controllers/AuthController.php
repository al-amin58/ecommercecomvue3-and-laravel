<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Auth;
use App\Models\Order;
class AuthController extends Controller
{

    public function adminDashboard() {
     return view('js/Dashboard/Index.vue');
    }

    public function login(Request $request)
    {

        $request->validate([
            'email'=> 'required|email|string',
            'password'=> 'required|string',
        ]);
    
        $user = User::where('email',$request->email)->first();
        if (!$user || !Hash::check($request->password, $user->password)){

            return response()->json([
                'status' => 'failed',
                'message' => 'Invalid Credentials'
            ], 401);
        }

        

        $user->token = $user->createToken($request->email)->plainTextToken;
        $response = [
            'status' =>'success',
            'message' => 'user is logged in successfully',
            'data' => $user,
        ];
        return response()->json($response,200);
    }

    // public function logout( Request $request)
    // {
    //    auth()->user()->tokens()->delete();
    //    return response()->json([
    //        "message"=>"logged out"
    //    ]);
    // }

    public function register(Request $request)
    {
        $registerUserData = $request->validate([
           'name' => 'required|string',
           'email' => 'required|string|email|unique:users',
            'password' => 'required|min:8'
        ]);
     User::create($registerUserData);

     return response()->json([
         'message' => 'user Created',
     ]);
    }
}
