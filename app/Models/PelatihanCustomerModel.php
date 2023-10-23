<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class PelatihanCustomerModel extends Model
{
    use HasFactory;
    
    protected $fillable = ['customer_id', 'pelatihan_id', 'acc'];


    public function customer() {
        return $this->belongsTo(User::class, 'customer_id', 'id');
    }
}
