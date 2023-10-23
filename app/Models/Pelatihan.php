<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Pelatihan extends Model
{
    use HasFactory;

    protected $table = 'pelatihans';

    // Schema::create('pelatihans', function (Blueprint $table) {
    //     $table->id();
    //     $table->string('judul_pelatihan');
    //     $table->date('tanggal_pelatihan');
    //     // $table->date('tanggal_pelatihan');
    //     $table->text('lokasi_pelatihan')->nullable();
    //     $table->text('deskripsi')->nullable();
    //     $table->unsignedBigInteger('created_by');
    //     $table->foreign('created_by')->references('id')->on('users')->onDelete('cascade');
    //     $table->timestamps();
    // });

    protected $fillable = ['judul_pelatihan', 'tanggal_pelatihan', 'lokasi_pelatihan', 'deskripsi', 'created_by'];


    public function members() {
        return $this->hasMany(PelatihanCustomerModel::class, 'pelatihan_id', 'id');
    }

    public function isMember() {
        return $this->hasOne(PelatihanCustomerModel::class, 'pelatihan_id')->where('customer_id', auth()->user()->id);
    }
}
