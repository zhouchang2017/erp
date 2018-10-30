<?php

namespace App\Modules\Channel\Dealpaw\Models;

use App\Modules\Scaffold\BaseModel as Model;

class Currency extends Model
{
    protected $connection = 'dealpaw';

    protected $fillable = ['code'];
}
