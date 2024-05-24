<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;
use App\Models\Product;
use App\Models\Order;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    
   
    public function up(): void
    {
        Schema::create('order_details', function (Blueprint $table) {
            $table->id();
            $table->foreignId(Order::class, 'order_id')->constrained('orders')->cascadeOnUpdate()->cascadeOnDelete();
            $table->foreignIdFor(Product::class, 'product_id')->constrained('products')->cascaeOnDelete()->cascadeOnUpdate();
            $table->integer('delivery_charge')->default(0);
            $table->string('payment_method')->default('cod')->nullable();
            $table->enum('payment_status',['pending', 'paid', 'due', 'cancel'])->default('pending');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('order_details');
    }
};
