<?php

namespace App\Modules\DealpawProduct\Models;

use App\Modules\Scaffold\BaseModel as Model;

class ProductOptionValueTranslation extends Model
{
    protected $connection = 'dealpaw';

//    public $timestamps = false;

    protected $fillable = ['value'];
}
