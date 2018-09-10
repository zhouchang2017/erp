<?php

namespace App\Modules\Warehouse\Models;

use App\Modules\Procurement\Enums\ManuallyStatus;
use App\Modules\Scaffold\BaseModel as Model;
use App\Modules\Warehouse\Contracts\WarehouseStorageContract;
use App\Modules\Warehouse\Observers\ManuallyObserver;
use App\Modules\Warehouse\Traits\WarehouseStorageTrait;
use App\User;
use Illuminate\Database\Eloquent\SoftDeletes;

class Manually extends Model implements WarehouseStorageContract
{
    use SoftDeletes, WarehouseStorageTrait;

    protected $fillable = ['user_id', 'warehouse_id', 'description', 'status'];

    protected $casts = [
        'history' => 'array',
    ];


    protected $allowedInclude = [

    ];

    /**
     * 数据模型的启动方法
     *
     * @return void
     */
    protected static function boot()
    {
        parent::boot();
        self::observe(ManuallyObserver::class);
    }

    public function scopeAllowedInclude()
    {
        return $this->allowedInclude;
    }

    public function scopeOfStatus($query, $status = null)
    {
        return $query->when($status, function ($query) use ($status) {
            return $query->where('status', $status);
        });
    }

    /**
     * 手动入库指定仓库
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function warehouse()
    {
        return $this->belongsTo(Warehouse::class);
    }

    /**
     * 手动入库创建人
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function user()
    {
        return $this->belongsTo(User::class);
    }

    public function manuallyInfo()
    {
        return $this->hasMany(ManuallyProductVariant::class);
    }


    public function getVariantList()
    {
        return $this->manuallyInfo->map(function ($item) {
            return [
                'product_id' => $item->product_id,
                'product_variant_id' => $item->product_variant_id,
                'product_provider_id' => $item->product_provider_id,
                'num' => $item->pcs,
                'good' => $item->good,
                'bad' => $item->bad,
            ];
        });
    }

    public function canStore(): bool
    {
        return $this->status === ManuallyStatus::getDescription(3);
    }

    public function statusIsFinished()
    {
        return $this->status === ManuallyStatus::getDescription(3);
    }
}
