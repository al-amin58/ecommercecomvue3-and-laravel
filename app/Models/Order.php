<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\User;
use App\Models\Address;
use App\Models\OrderDetail;
use App\Models\Product;

class Order extends Model
{
    use HasFactory;
    protected $fillable=['user_id','address_id','price', 'order_id','order_date'];
    // protected $guarded = ['id'];

    public function orderdetail(){
        return $this->hasOne(OrderDetail::class);
    }
    // public function products()
    // {
    //     return $this->hasMany(Product::class);
    // }
    public function product()
    {
        return $this->hasOne(Product::class, 'id');
    }
    public function user(){
        return $this->belongsTo(User::class, 'user_id');
    }
    public function address(){
        return $this->belongsTo(Address::class,'address_id');
    }
   

}

