<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Requests\OrderRequest;
use App\Models\User;
use App\Models\Address;
use App\Models\Product;
use App\Models\Order;
use App\Models\OrderDetail;
use Carbon\Carbon;
use Illuminate\Support\Str;




class OrderController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index(Request $request)
    {   
       
         $order = Order::with(['orderdetail','user'])->latest()->get();
         return response()->json($order);
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {

    
      
        $data = $request->all();
       
        $data['order_id']= Str::random(9);
        $data['order_date']= Carbon::now();
       
        $product = Product::find($request->product_id);
        $data['price']=$product->bdt_price; 


        $order = Order::create($data);

        OrderDetail::create([
            'product_id' =>$product->id,
            'order_id' => $order->id,
        ]);

        
       
    
        return response()->json([
            'status' => 'success',
            'message' => 'Order Added Succesfully'
         
        ]);
  
        
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        $order = Order::with('orderdetail','user', 'address','orderdetail.product')->findOrFail($id);
        return response()->json($order);
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        $order = Order::find($id);
        $order->delete();
    }
}
