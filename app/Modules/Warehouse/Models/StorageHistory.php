<?php

namespace App\Modules\Warehouse\Models;
use App\Modules\Scaffold\BaseModel as Model;

class StorageHistory extends Model {

    protected $fillable = [
        'warehouse_id', 'product_id', 'product_variant_id', 'good', 'bad',
    ];

    public function origin()
    {
        return $this->morphTo();
    }

}
