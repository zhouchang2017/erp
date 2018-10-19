<?php

namespace App\Modules\Channel\Dealpaw\Models;

use App\Modules\Channel\Dealpaw\Observers\DealpawProductObserver;
use App\Modules\Channel\Dealpaw\Services\DealpawService;
use App\Modules\Product\Models\ProductVariant;
use Illuminate\Database\Eloquent\Model;

class DealpawProduct extends Model
{
    protected $fillable = [
        'code',
        'image',
        'width',
        'height',
        'depth',
        'weight',
        'stock',
        'sold',
        'option_values',
        'name',
    ];

    protected $casts = [
        'option_values' => 'array',
    ];

    protected static function boot()
    {
        parent::boot();
        self::observe(DealpawProductObserver::class);
    }


    public function getOptionsAttribute()
    {
        return implode('-', collect($this->option_values)->pluck('value')->toArray());
    }

    public function localVariant()
    {
        return $this->belongsTo(ProductVariant::class, 'original_variant_id');
    }

    public function dealpaw()
    {
        return $this->belongsToMany(Dealpaw::class, 'dealpaw_product');
    }

    public function prices()
    {
        return $this->hasMany(DealpawProductPrice::class, 'dealpaw_product_id');
    }

    public function relationLocal()
    {
        return $this->morphToMany(
            ProductVariant::class,
            'relationable',
            'relation_product',
            null,
            'variant_id');
    }

    public function syncToDealpaw()
    {
        (new DealpawService($this->dealpaw()->first()))->syncProductToDealpaw($this);
    }
}
