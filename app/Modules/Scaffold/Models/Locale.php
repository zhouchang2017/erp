<?php

namespace App\Modules\Scaffold\Models;

use Illuminate\Database\Eloquent\Model;

class Locale extends Model
{
    protected $connection = 'dealpaw';

    protected $fillable = ['code'];
}
