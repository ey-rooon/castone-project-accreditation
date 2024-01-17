<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Role extends Model
{
    use HasFactory;
    public $isCoordinator;

    public function __construct(bool $isCoordinator)
    {
        $this->isCoordinator = $isCoordinator;
    }
}
