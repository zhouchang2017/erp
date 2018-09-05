<?php

namespace App\Modules\Procurement\Models;


use App\Modules\Procurement\Enums\PlanStatus;
use App\Modules\Procurement\Observers\ProcurementPlanObserver;
use App\Modules\Procurement\Traits\ProcurementPlanTrait;
use App\Modules\Product\Models\ProductVariant;
use App\Modules\Warehouse\Models\Warehouse;
use App\User;
use Illuminate\Database\Eloquent\SoftDeletes;
use App\Modules\Scaffold\BaseModel as Model;

/**
 * Class ProcurementPlan
 * @package App\Models
 */
class ProcurementPlan extends Model
{
    use SoftDeletes, ProcurementPlanTrait;

    protected $dates = ['deleted_at'];

    /**
     * @var array
     */
    protected $fillable = [
        'warehouse_id',
        'user_id',
        'description',
        'comment',
        'history',
        'status',
    ];

    /**
     * @var array
     */
    protected $casts = [
        'history' => 'array',
        'comment' => 'array',
    ];

    protected $allowedInclude = [
        'warehouse',
        'user',
        'plan_info',
        'plan_info.provider',
        'plan_info.product',
        'plan_info.variant.providers',
        'plan_info.variant.product',
    ];

    protected $appends = ['procurement_id'];

    /**
     * 数据模型的启动方法
     *
     * @return void
     */
    protected static function boot()
    {
        parent::boot();
        self::observe(ProcurementPlanObserver::class);
    }

    public function scopeAllowedInclude()
    {
        return $this->allowedInclude;
    }

    public function getProcurementIdAttribute()
    {
        return $this->procurement->id ?? null;
    }


    /**
     * 采购计划指定仓库
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function warehouse()
    {
        return $this->belongsTo(Warehouse::class);
    }

    /**
     * 采购单创建人
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function user()
    {
        return $this->belongsTo(User::class);
    }

    /**
     * 采购单关联的产品变体
     */
    public function variants()
    {
        return $this->hasMany(ProcurementPlanProductVariant::class);
    }

    public function procurement()
    {
        return $this->hasOne(Procurement::class);
    }

    public function planInfo()
    {
        return $this->hasMany(ProcurementPlanProductVariant::class);
    }

    public function getUncommittedAttribute()
    {
        return $this->status === PlanStatus::getDescription(0);
    }

    public function getPendingAttribute()
    {
        return $this->status === PlanStatus::getDescription(1);
    }

    public function getReturnAttribute()
    {
        return $this->status === PlanStatus::getDescription(2);
    }

    public function getCancelAttribute()
    {
        return $this->status === PlanStatus::getDescription(3);
    }

    public function getAlreadyAttribute()
    {
        return $this->status === PlanStatus::getDescription(4);
    }
}
