<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class SubComponentFile extends Model
{
    use HasFactory;
    public function backUp(){
        return $this->hasMany(IndicatorBackup::class,"file_id","id")->where('type',3);
    }
}
