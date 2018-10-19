<?php

namespace App\Modules\Channel\Dealpaw\Models;

use App\Modules\Channel\Dealpaw\Observers\DealpawProductPriceObserver;
use App\Modules\Scaffold\Traits\MoneyFormatAble;
use Illuminate\Database\Eloquent\Model;

class DealpawProductPrice extends Model
{
    use MoneyFormatAble;

    protected $touches = ['product'];

    protected $fillable = [
        'original_price',
        'price',
        'deal_price',
        'dealpaw_id',
    ];

    protected static function boot()
    {
        parent::boot();
        self::observe(DealpawProductPriceObserver::class);
    }

    public function getOriginalPriceAttribute($value)
    {
        return $this->displayCurrencyUsing($value);
    }

    public function setOriginalPriceAttribute($value)
    {
        $this->attributes['original_price'] = $this->saveCurrencyUsing($value);
    }

    public function getPriceAttribute($value)
    {
        return $this->displayCurrencyUsing($value);
    }

    public function setPriceAttribute($value)
    {
        $this->attributes['price'] = $this->saveCurrencyUsing($value);
    }

    public function getDealPriceAttribute($value)
    {
        return $this->displayCurrencyUsing($value);
    }

    public function setDealPriceAttribute($value)
    {
        $this->attributes['deal_price'] = $this->saveCurrencyUsing($value);
    }


    public function dealpaw()
    {
        return $this->belongsTo(Dealpaw::class);
    }

    public function product()
    {
        return $this->belongsTo(DealpawProduct::class, 'dealpaw_product_id');
    }
}
