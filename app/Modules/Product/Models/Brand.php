<?php

namespace App\Modules\Product\Models;

use App\Modules\Product\Observers\BrandObserver;
use App\Modules\Scaffold\BaseModel as Model;
use App\Modules\Scaffold\Contracts\AssetRelation;
use App\Modules\Scaffold\Traits\AssetTrait;
use Dimsav\Translatable\Translatable;

class Brand extends Model implements AssetRelation
{
    use AssetTrait, Translatable;

    public $translationModel = BrandTranslation::class;

    public $translatedAttributes = ['name'];

    protected $fillable = ['description'];

    /**
     * 数据模型的启动方法
     *
     * @return void
     */
    protected static function boot()
    {
        parent::boot();
        self::observe(BrandObserver::class);
    }

    public function products()
    {
        return $this->hasMany(Product::class);
    }

}
