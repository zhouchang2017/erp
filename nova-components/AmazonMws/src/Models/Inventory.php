<?php

namespace Chang\AmazonMws\Models;

use Illuminate\Database\Eloquent\Model;

class Inventory extends Model
{
    protected $table = 'amazon_inventories';

    protected $casts = [
        'earliest_availability' => 'array',
        'supply_detail' => 'array',
    ];

    protected $fillable = [
        'seller_sku',
        'asin',
        'fnsku',
        'in_stock_supply_quantity',
        'condition',
        'total_supply_quantity',
        'earliest_availability',
        'supply_detail'
    ];

    public function getTitleAttribute()
    {
        return $this->listing->title;
    }

    public function getAvatarAttribute()
    {
        return $this->listing->avatar;
    }

    public function listing()
    {
        return $this->belongsTo(Listing::class, 'sku', 'seller_sku');
    }
}
