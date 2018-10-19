<?php

namespace App\Modules\Channel\Dealpaw\Models;

use Illuminate\Database\Eloquent\Model;

class ShipmentDealpawOrderItem extends Model
{
    protected $fillable = [
        'tracking_number',
        'order_item_id',
        'order_id',
    ];

    public function order()
    {
        return $this->belongsTo(DealpawOrder::class, 'order_id');
    }

    public function item()
    {
        return $this->belongsTo(DealpawOrderItem::class, 'order_item_id');
    }
}
