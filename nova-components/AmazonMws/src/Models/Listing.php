<?php

namespace Chang\AmazonMws\Models;

use App\Modules\Product\Models\ProductVariant;
use Illuminate\Database\Eloquent\Model;

class Listing extends Model
{
    protected $table = 'amazon_listings';

    protected $fillable = [
        'sku',
        'asin',
        'price',
        'quantity',
        'business_price',
        'business_options',

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
        'business_options' => 'array',
        'variation_parent' => 'array',
        'props' => 'array',
        'sales_rank' => 'array',
    ];

    public function getFbaStockAttribute()
    {
        return $this->inventory->total_supply_quantity;
    }


    public function inventory()
    {
        return $this->hasOne(Inventory::class, 'seller_sku', 'sku')
            ->withDefault([
                'total_supply_quantity' => 0,
            ]);
    }

    public function localVariant()
    {
        return $this->belongsTo(ProductVariant::class, 'original_variant_id');
    }
}
