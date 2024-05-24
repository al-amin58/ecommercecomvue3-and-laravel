<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\ProductController;
use App\Http\Controllers\PostController;
use \App\Http\Controllers\CategoryController;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\OrderController;
use App\Http\Controllers\AddressController;
use App\Http\Controllers\CheckoutController;
use App\Http\Controllers\DashboardController;
;



Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});
Route::resource('dashboard', DashboardController::class);
Route::resource('products', ProductController::class);
Route::resource('posts', PostController::class);
Route::resource('categories', CategoryController::class);
Route::get('/delete-image/{id}',[ProductController::class,'deleteImage']);
Route::resource('orders', OrderController::class);
Route::resource('address', AddressController::class);
Route::resource('checkout', CheckoutController::class);



Route::post('/login', [AuthController::class, 'login'] );
Route::post('/logout', [AuthController::class, 'logout'] );
Route::post('/register', [AuthController::class, 'register'] );
