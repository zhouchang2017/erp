<?php

namespace App\Modules\ProductProvider\Models;

use App\Modules\Product\Models\ProductVariant;
use App\Modules\ProductProvider\Observers\ProductProviderObserver;
use App\Modules\Scaffold\BaseModel as Model;
use App\Modules\Scaffold\Contracts\AssetRelation;
use App\Modules\Scaffold\Traits\AddressTrait;
use App\Modules\Scaffold\Traits\AssetTrait;
use Spatie\Image\Exceptions\InvalidManipulation;
use Spatie\MediaLibrary\HasMedia\HasMedia;
use Spatie\MediaLibrary\HasMedia\HasMediaTrait;
use Spatie\MediaLibrary\Models\Media;

/**
 * @property mixed providerPayment
 * @property mixed addresses
 * @property mixed info
 * @property mixed products
 */
class ProductProvider extends Model implements AssetRelation, HasMedia
{
    use AddressTrait, AssetTrait, HasMediaTrait;

    protected $connection = 'mysql';

    protected $fillable = [
        'name',
        'code',
        'level',
        'description',
    ];

    /**
     * 数据模型的启动方法
     *
     * @return void
     */
    protected static function boot()
    {
        parent::boot();
        self::observe(ProductProviderObserver::class);
    }

    public function registerMediaCollections()
    {
        $this->addMediaCollection('main')->singleFile();
        $this->addMediaCollection('product_provider_image');
    }

    public function info()
    {
        return $this->hasOne(ProductProviderInfo::class);
    }

    public function providerPayment()
    {
        return $this->hasOne(ProductProviderPayment::class);
    }

    public function products()
    {
        return $this->belongsToMany(ProductVariant::class, 'variant_provider')->withPivot('price')->withTimestamps();
    }

    public function productVariants()
    {
        return $this->belongsToMany(ProductVariant::class, 'variant_provider')->withPivot('price')->withTimestamps();
    }

}
