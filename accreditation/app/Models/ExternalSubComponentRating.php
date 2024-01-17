<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ExternalSubComponentRating extends Model
{
    use HasFactory;
    protected $fillable = [
        'accreditation_id',
        'user_id',
        'parameter_id',
        'sub_component_id',
        'rating',
        'comment',
    ];
}
