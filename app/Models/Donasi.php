<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Donasi extends Model
{
    use HasFactory;

    // $table->id();
    // $table->unsignedBigInteger('user_id');
    // $table->foreign('user_id')->references('id')->on('users');
    // $table->date('date_donasi')->nullable();
    // $table->text("google_coordinate")->nullable();
    // $table->integer('jumlah_donasi')->default(0);
    // $table->timestamps();

    protected $fillable =  ['date_donasi', 'google_coordinate', 'status_id', 'jumlah_donasi', 'user_id', 'alamat_donasi', 'latitude', 'longitude'];

    
}
