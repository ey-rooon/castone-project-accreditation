<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ProgramInstrument extends Model
{
    use HasFactory;

    protected $fillable = ['program_id'];

    public function program()
    {
        return $this->belongsTo(Program::class);
    }
}
