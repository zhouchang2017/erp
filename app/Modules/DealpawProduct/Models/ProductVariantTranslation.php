<?php

namespace App\Modules\DealpawProduct\Models;

use App\Modules\Scaffold\BaseModel as Model;

class ProductVariantTranslation extends Model
{
    protected $connection = 'dealpaw';

    protected $fillable = ['name'];
}
