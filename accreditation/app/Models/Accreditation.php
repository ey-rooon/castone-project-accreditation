<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Accreditation extends Model
{
    use HasFactory;

    public function members()
    {
        return $this->hasMany(Member::class, 'accreditation_id');
    }

    public function area_members()
    {
        return $this->hasMany(AreaMember::class, 'accreditation_id');
    }

    public function program_level()
    {
        return $this->belongsTo(ProgramLevel::class);
    }
}
