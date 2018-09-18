<?php

namespace Chang\AmazonMws\Models;

use Illuminate\Database\Eloquent\Model;

class Inventory extends Model
{
    protected $table = 'amazon_inventories';

    protected $casts = [
        'business_price_options' => 'array',
    ];

    protected $fillable = [
        'sku',
        'asin',
        'price',
        'quantity',
        'business_price',
        'business_price_options',
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
        return $this->belongsTo(Listing::class, 'sku', 'sku');
    }
}
