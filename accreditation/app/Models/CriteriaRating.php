<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class CriteriaRating extends Model
{
    use HasFactory;

    protected $fillable = ['user_id', 'criteria_id', 'accreditation_id', 'area_id', 'rating'];
}
