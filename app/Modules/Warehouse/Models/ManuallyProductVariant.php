<?php

namespace App\Modules\Warehouse\Models;

use App\Modules\Product\Models\Product;
use App\Modules\Product\Models\ProductVariant;
use App\Modules\ProductProvider\Models\ProductProvider;
use App\Modules\Warehouse\Observers\ManuallyProductVariantObserver;
use App\User;
use App\Modules\Scaffold\BaseModel as Model;

/**
 * Class ManuallyProductVariant
 * @package App\Models
 */
class ManuallyProductVariant extends Model
{

    /**
     * @var string
     */
    protected $table = 'manually_product_variant';

    protected $fillable = [
        'manully_id',
        'product_id',
        'product_variant_id',
        'price',
        'pcs',
        'offer_price',
        'product_provider_id',
        'user_id',
        'good',
        'bad',
    ];

    protected static function boot()
    {
        parent::boot();
        self::observe(ManuallyProductVariantObserver::class);
    }

    /**
     * 产品供应商
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function provider()
    {
        return $this->belongsTo(ProductProvider::class, 'product_provider_id');
    }

    /**
     * 手工入库
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function manually()
    {
        return $this->belongsTo(Manually::class, 'manually_id');
    }

    public function product()
    {
        return $this->belongsTo(Product::class, 'product_id');
    }

    public function variant()
    {
        return $this->belongsTo(ProductVariant::class, 'product_variant_id');
    }

    public function user()
    {
        return $this->belongsTo(User::class);
    }

    /**
     * @return \Illuminate\Database\Eloquent\Relations\MorphMany
     */
    public function history()
    {
        return $this->morphMany(StorageHistory::class, 'origin');
    }

    /**
     * @return int
     */
    public function getTotalPrice(): int
    {
        return (int)$this->price * (int)$this->pcs;
    }

}
