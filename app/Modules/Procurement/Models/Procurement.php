<?php

namespace App\Modules\Procurement\Models;

use App\Modules\Procurement\Observers\ProcurementObserver;
use Illuminate\Database\Eloquent\SoftDeletes;
use App\Modules\Scaffold\BaseModel as Model;

/**
 * Class Procurement
 * @package App\Models
 */
class Procurement extends Model
{
    use SoftDeletes;
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
        'procurement_at',       //采购日期
        'pre_arrived_at',       //预计到货日期
        'arrived_at',           //到货日期
        'shipment',             //物流
    ];

    /**
     * @var array
     */
    protected $casts = [
        'shipment' => 'array',
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

    public function getWarehouseAttribute()
    {
        return $this->plan->warehouse;
    }

    public function getHistoryAttribute()
    {
        return $this->planInfo()->has('history')->with('history')->get();
    }


}
