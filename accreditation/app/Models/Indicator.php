<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Indicator extends Model
{
    use HasFactory;

    public function indicatorCategory()
    {
        return $this->hasOne(IndicatorCategory::class);
    }
}
