<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class IndicatorBackup extends Model
{
    use HasFactory;
    protected $table = 'indicator_backup_file';
    protected $fillable = [
       'file_id', 
       'user_id',
       'file_name', 
       'screen_name', 
       'file_type', 
       'file_location',
       'type'
    ];
}
