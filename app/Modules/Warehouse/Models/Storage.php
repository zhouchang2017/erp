<?php

namespace App\Modules\Warehouse\Models;
use App\Modules\Scaffold\BaseModel as Model;


class Storage extends Model
{
    protected $fillable = [
      'warehouse_id','product_id','product_variant_id','num','good','bad'
    ];
}
