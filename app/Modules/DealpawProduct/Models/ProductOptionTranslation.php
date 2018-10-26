<?php

namespace App\Modules\DealpawProduct\Models;

use App\Modules\Scaffold\BaseModel as Model;

class ProductOptionTranslation extends Model
{
    protected $connection = 'dealpaw';

//    public $timestamps = false;

    protected $fillable = ['name'];
}
