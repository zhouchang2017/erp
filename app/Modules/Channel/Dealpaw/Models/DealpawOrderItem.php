<?php

namespace App\Modules\Channel\Dealpaw\Models;

use App\Modules\Scaffold\Traits\MoneyFormatAble;
use Illuminate\Database\Eloquent\Model;

class DealpawOrderItem extends Model
{
    use MoneyFormatAble;
    protected $fillable = [
        'variant_code',
        'quantity',
        'total',
        'product_code',
        'product_name',
        'option_values',
        'image',
    ];

    protected $casts = [
        'option_values' => 'array',
    ];

    public function getTotalAttribute($value)
    {
        return $this->displayCurrencyUsing($value);
    }

    public function order()
    {
        return $this->belongsTo(DealpawOrder::class, 'order_id', 'id');
    }

    public function variant()
    {
        return $this->belongsTo(DealpawProduct::class, 'variant_code', 'code');
    }

    public function shipment()
    {
        return $this->hasOne(ShipmentDealpawOrderItem::class,'order_item_id');
    }
}
