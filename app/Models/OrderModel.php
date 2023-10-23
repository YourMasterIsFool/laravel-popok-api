<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class OrderModel extends Model
{
    use HasFactory;

    protected $table='order_models';

    // $table->text('alamat');
    //         $table->integer('quantity');
    //         $table->float('price');
    //         $table->unsignedBigInteger('product_id');
    //         $table->foreign('product_id')->references('id')->on('products')->onDelete('cascade');
    //         $table->unsignedBigInteger('customer_id');
    //         $table->foreign('customer_id')->references('id')->on('users')->onDelete('cascade');

    protected $fillable = ['quantity', 'price', 'product_id', 'customer_id', 'alamat', 'longitude', 'latitude'];

    public function product() {
        return $this->belongsTo(Product::class, 'product_id', 'id');
    }

    public function status() {
        return $this->belongsTo(StatusPembayaran::class, 'order_status', 'code');
    }

    public function customer() {
        return $this->belongsTo(User::class, 'customer_id', 'id');
    }
}
