<?php

namespace App\Modules\Warehouse\Models;

use App\Modules\Product\Models\Product;
use App\Modules\Product\Models\ProductVariant;
use App\Modules\Scaffold\BaseModel as Model;


class Storage extends Model
{
    protected $fillable = [
        'warehouse_id',
        'product_id',
        'product_variant_id',
        'num',
        'good',
        'bad',
    ];

    public function warehouse()
    {
        return $this->belongsTo(Warehouse::class);
    }

    public function product()
    {
        return $this->belongsTo(Product::class);
    }

    public function productVariant()
    {
        return $this->belongsTo(ProductVariant::class);
    }
}
