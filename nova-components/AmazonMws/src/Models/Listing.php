<?php

namespace Chang\AmazonMws\Models;

use Illuminate\Database\Eloquent\Model;

class Listing extends Model
{
    protected $table = 'amazon_products';

    protected $fillable = [
        'sku',
        'asin',
        'marketplace_id',
        'binding',
        'brand',
        'color',
        'avatar',
        'title',
        'part_number',
        'product_group',
        'product_type_name',
        'variation_parent',
        'props',
        'sales_rank',
    ];

    protected $casts = [
        'variation_parent' => 'array',
        'props' => 'array',
        'sales_rank' => 'array',
    ];

    public function getPriceAttribute()
    {
        return $this->inventory->price;
    }

    public function inventory()
    {
        return $this->hasOne(Inventory::class, 'sku', 'sku');
    }
}
