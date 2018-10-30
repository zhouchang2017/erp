<?php

namespace App\Modules\DealpawProduct\Models;

use App\Modules\Scaffold\BaseModel as Model;
use App\Modules\Scaffold\Traits\MoneyFormatAble;

class ProductPrice extends Model
{
    use MoneyFormatAble;

    protected $connection = 'mysql';

    protected $table = 'product_variant_prices';

    protected $fillable = ['price'];

    public function variant()
    {
        return $this->belongsTo(ProductVariant::class, 'variant_id');
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
