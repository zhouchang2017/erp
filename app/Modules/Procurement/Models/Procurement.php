<?php

namespace App\Modules\Procurement\Models;

use App\Modules\Procurement\Observers\ProcurementObserver;
use App\Modules\Warehouse\Contracts\WarehouseStorageContract;
use App\Modules\Warehouse\Traits\StorageHistoryTrait;
use App\Modules\Warehouse\Traits\WarehouseStorageTrait;
use Illuminate\Database\Eloquent\SoftDeletes;
use App\Modules\Scaffold\BaseModel as Model;

/**
 * Class Procurement
 */
class Procurement extends Model implements WarehouseStorageContract
{
    use SoftDeletes, StorageHistoryTrait, WarehouseStorageTrait;
    /**
     * @var array
     */
    protected $procurement_status = [
        'part_finished', // 未全部到货
        'pending', // 等待发货
        'sending',// 途中
        'finished',// 全部到货
        'cancel'// 作废
    ];

    /**
     * @var array
     */
    protected $payment_status = [
        'unpaid',       // 未支付
        'paid',         // 以支付
        'part_paid',    // 部分支付
        'cancel',       // 以取消支付
    ];

    /**
     * @var array
     */
    protected $fillable = [
        'procurement_status',   //采购状态
        'total_pcs',            //总计件数
        'total_price',          //货款
        'able_price',           //应付款
        'already_price',        //已付款
        'shipment_at',       //发货日期
        'pre_arrived_at',       //预计到货日期
        'arrived_at',           //到货日期
        'shipment',             //物流
    ];

    /**
     * @var array
     */
    protected $casts = [
        'shipment' => 'array',
        'shipment_at' => 'datetime',
        'pre_arrived_at' => 'datetime',
    ];


    /**
     * 数据模型的启动方法
     *
     * @return void
     */
    protected static function boot()
    {
        parent::boot();
        self::observe(ProcurementObserver::class);
    }

    public function warehouse()
    {
        return $this->plan->warehouse;
    }


    /**
     * 对应的采购计划
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function plan()
    {
        return $this->belongsTo(ProcurementPlan::class, 'procurement_plan_id');
    }

    /**
     * 所有产品变体
     * @return \Illuminate\Database\Eloquent\Relations\HasMany
     */
    public function planInfo()
    {
        return $this->hasMany(ProcurementPlanProductVariant::class, 'procurement_plan_id', 'procurement_plan_id');
    }

    public function variants()
    {
        return $this->hasManyThrough(
            ProcurementPlanProductVariant::class,
            ProcurementPlan::class,
            'id',
            'procurement_plan_id',
            'procurement_plan_id',
            'id'
        );
    }

    public function getWarehouseAttribute()
    {
        return $this->plan->warehouse;
    }

    /**
     * @return mixed
     */
    public function getVariantList()
    {
        return $this->planInfo->map(function ($item) {
            return [
                'product_id' => $item->product_id,
                'product_variant_id' => $item->product_variant_id,
                'product_provider_id' => $item->product_provider_id,
                'num' => $item->arrived_pcs,
                'good' => $item->good,
                'bad' => $item->bad,
            ];
        });
    }
}
