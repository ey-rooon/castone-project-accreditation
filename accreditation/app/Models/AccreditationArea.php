<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class AccreditationArea extends Model
{
    use HasFactory;
    protected $fillable = [
        'accreditation_id',
        'area_id',
    ];
}
