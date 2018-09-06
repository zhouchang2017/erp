<?php

namespace App\Modules\Procurement\Models;

use App\Modules\Procurement\Observers\ProcurementPlanProductVariantObserver;
use App\Modules\Product\Models\Product;
use App\Modules\Product\Models\ProductVariant;
use App\Modules\ProductProvider\Models\ProductProvider;
use App\Modules\Scaffold\BaseModel as Model;

/**
 * Class ProcurementPlanProductVariant
 * @package App\Models
 */
class ProcurementPlanProductVariant extends Model
{
    /**
     * @var string
     */
    protected $table = 'procurement_plan_product_variant';

    protected $fillable = [
        'procurement_plan_id',
        'product_id',
        'product_variant_id',
        'price',
        'pcs',
        'offer_price',
        'product_provider_id',
        'user_id',
        'arrived_pcs',
        'good',
        'bad',
        'lost',
    ];

    protected $touches = ['plan'];

    /**
     * 数据模型的启动方法
     *
     * @return void
     */
    protected static function boot()
    {
        parent::boot();
        self::observe(ProcurementPlanProductVariantObserver::class);
    }

    /**
     * 产品供应商
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function provider()
    {
        return $this->belongsTo(ProductProvider::class, 'product_provider_id');
    }


    public function product()
    {
        return $this->belongsTo(Product::class);
    }

    /**
     * @return int
     */
    public function getTotalPrice(): int
    {
        return (int)$this->price * (int)$this->pcs;
    }

    /**
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function plan()
    {
        return $this->belongsTo(ProcurementPlan::class, 'procurement_plan_id');
    }

    public function variant()
    {
        return $this->belongsTo(ProductVariant::class, 'product_variant_id');
    }


    /**
     * @return string
     */
    public function getProcurementStatus()
    {
        $res = (int)$this->pcs - (int)$this->arrived_pcs;
        $result = 'sending';
        switch (true) {
            case ($res > 0 && $res < (int)$this->pcs):
                $result = 'part_finished';
                break;
            case ($res === (int)$this->pcs):
                $result = 'sending';
                break;
            case ($res === 0):
                $result = 'finished';
        }
        return $result;
    }


}
