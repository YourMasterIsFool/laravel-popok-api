<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class KurirStatus extends Model
{
    use HasFactory;

    protected  $table = 'kurir_statuses';
    protected $fillable = ['code', 'status'];
}
