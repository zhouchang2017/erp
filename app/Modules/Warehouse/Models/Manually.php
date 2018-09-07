<?php

namespace App\Modules\Warehouse\Models;

use App\Modules\Product\Models\ProductVariant;
use App\Modules\Scaffold\BaseModel as Model;

//use App\Observers\ManuallyObserver;
use App\User;
use Illuminate\Database\Eloquent\SoftDeletes;

class Manually extends Model
{
    use SoftDeletes;

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
//        self::observe(ManuallyObserver::class);
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

    public function getHistoryAttribute()
    {
        return $this->manuallyInfo()->has('history')->with('history')->get();
    }

}
