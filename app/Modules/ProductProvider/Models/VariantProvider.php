<?php

namespace App\Modules\ProductProvider\Models;

use App\Modules\DealpawProduct\Models\ProductVariant;
use App\Modules\Scaffold\Traits\MoneyFormatAble;
use Illuminate\Database\Eloquent\Model;

class VariantProvider extends Model
{
    use MoneyFormatAble;

    protected $connection = 'mysql';

    protected $fillable = [
        'product_variant_id',
        'product_provider_id',
        'price',
    ];

    public function variant()
    {
        return $this->belongsTo(ProductVariant::class, 'product_variant_id');
    }

    public function provider()
    {
        return $this->belongsTo(ProductProvider::class, 'product_provider_id');
    }

    public function getPriceAttribute($value)
    {
        return $this->displayCurrencyUsing($value);
    }

    public function setPriceAttribute($value)
    {
        $this->attributes['price'] = $this->saveCurrencyUsing($value);
    }
}
