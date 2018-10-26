<?php

namespace App\Modules\DealpawProduct\Models;

use App\Modules\Scaffold\BaseModel as Model;

class ProductAttributeTranslation extends Model
{
    protected $connection = 'dealpaw';

//    public $timestamps = false;

    protected $fillable = ['name'];
}
