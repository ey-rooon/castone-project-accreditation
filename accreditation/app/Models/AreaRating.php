<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class AreaRating extends Model
{
    use HasFactory;

    protected $fillable = [
        'accreditation_id',
        'user_id',
        'area_id',
        'rating',
    ];
}
