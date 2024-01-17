<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Area extends Model
{
    use HasFactory;
    protected $guarded = [];

    public function parameters()
    {
        return $this->hasMany(Parameter::class);
    }

    public function instrument()
    {
        return $this->belongsTo(Instrument::class);
    }


}
