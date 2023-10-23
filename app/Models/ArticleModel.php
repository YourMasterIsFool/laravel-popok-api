<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ArticleModel extends Model
{
    use HasFactory;

    protected $table ='article_models';

    protected $fillable = [
        'description',
        'title',
        'file_path',
        'user_id',
        'reader',
    ];
}
