<?php

namespace App\Modules\Procurement\Models;


use App\Modules\Procurement\Observers\ProcurementPlanObserver;
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
    use SoftDeletes;

    protected $dates = ['deleted_at'];
    /**
     * @var array
     */
    protected $status = [
        'uncommitted',//未提交
        'pending',//待审核
        'return',//退回修改
        'cancel',//取消采购
        'already'//已下单
    ];

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

    protected $fieldSearchable = [
        'status','code'
    ];

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
     * @return \Illuminate\Database\Eloquent\Relations\HasMany
     */
    public function variants()
    {
//        return $this->belongsToMany(ProductVariant::class)->using(ProcurementPlanProductVariant::class)
//            ->as('plan_info')
//            ->withPivot(
//            'id','price','pcs','arrived_pcs','offer_price','product_id','product_provider_id','user_id','good','bad','lost'
//            )
//            ->withTimestamps();
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
}
