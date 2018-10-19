<?php

namespace Chang\AmazonMws\Models;

use Illuminate\Database\Eloquent\Model;

class OrderItem extends Model
{

    protected $table = 'amazon_order_items';

    protected $fillable = [
        'asin',
        'seller_sku',
        'order_item_id',
        'title',
        'quantity_ordered',
        'quantity_shipped',
        'item_price',
        'shipping_price',
        'gift_wrap_price',
        'item_tax',
        'shipping_tax',
        'shipping_discount',
        'promotion_discount',
        'promotion_ids',
        'cod_fee',
        'cod_fee_discount',
        'gift_message_text',
        'gift_wrap_level',
        'invoice_data',
        'condition_note',
        'condition_id',
        'condition_subtype_id',
        'scheduled_delivery_start_date',
        'scheduled_delivery_end_date',

        'amazon_order_id',
    ];

    protected $casts = [
        'item_price' => 'array',
        'shipping_price' => 'array',
        'gift_wrap_price' => 'array',
        'item_tax' => 'array',
        'shipping_tax' => 'array',
        'gift_wrap_tax' => 'array',
        'shipping_discount' => 'array',
        'promotion_discount' => 'array',
        'cod_fee' => 'array',
        'cod_fee_discount' => 'array',
        'scheduled_delivery_start_date' => 'datetime',
        'scheduled_delivery_end_date' => 'datetime',
        'promotion_ids'=>'array'
    ];

    public function order()
    {
        return $this->belongsTo(Order::class, 'order_id');
    }
}
