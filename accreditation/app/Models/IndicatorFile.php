<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;

class IndicatorFile extends Model
{
    use HasFactory;
    protected $fillable = [
        'file_order',
    ];
    public function backUp(){
        return $this->hasMany(IndicatorBackup::class,"file_id","id")->where('type',1);
    }
}