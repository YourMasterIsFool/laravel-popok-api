<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Product extends Model
{
    use HasFactory;

    // $table->id();
    // $table->unsignedBigInteger('user_id');
    // $table->foreign('user_id')->references('id')->on('users');
    // $table->text('file_path')->nullable();
    // $table->string('product_title');
    // $table->text('product_description');
    // $table->float('product_price')->default(0);

    protected $fillable = ['user_id', 'file_path', 'product_title', 'product_description', 'product_price', 'stok'];

    protected $table = 'products';
}
