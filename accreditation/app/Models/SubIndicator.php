<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class SubIndicator extends Model
{
    use HasFactory;

    public function sub_components()
    {
        return $this->hasMany(SubIndicatorComponent::class);
    }
}
