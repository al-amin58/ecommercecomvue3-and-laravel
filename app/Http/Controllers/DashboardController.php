<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\User;
use App\Models\Order;
use App\Models\Product;
use App\Models\OrderDetail;
class DashboardController extends Controller
{
   public function index() {
   
      $totalSeals = Order::all()->count();
      $totalOrder = OrderDetail::all()->count();
      $totalProduct = Product::all()->count();
      
    
     $user = User::all();
     return response()->json([
      'user' => $user,
      'totalseals' => $totalSeals ,
      'totalOder' => $totalOrder,
      'totalProduct' =>$totalProduct
      ]
    );
    }
    
}
