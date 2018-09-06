<?php

namespace App\Modules\Warehouse\Models;

use App\Modules\Procurement\Models\Procurement;
use App\Modules\Procurement\Models\ProcurementPlan;
use App\Modules\Scaffold\BaseModel as Model;
use App\Modules\Scaffold\Traits\AddressTrait;
use App\Modules\Warehouse\Observers\WarehouseObserver;
use App\Modules\Warehouse\Traits\WarehouseTrait;

/**
 * 仓库
 * Class Warehouse
 * @package App\Models
 */
class Warehouse extends Model
{
    use AddressTrait, WarehouseTrait;

    protected $fillable = ['name', 'type_id'];

    protected $fieldSearchable = [
        'id',
        'name',
    ];

    protected $allowedInclude = [
        'type',
    ];

    /**
     * 数据模型的启动方法
     *
     * @return void
     */
    protected static function boot()
    {
        parent::boot();

        self::observe(WarehouseObserver::class);
    }


    public static function getAllowedInclude()
    {
        return (new static())->allowedInclude;
    }


    public function type()
    {
        return $this->belongsTo(WarehouseType::class, 'type_id');
    }


    public function manuallise()
    {
        return $this->hasMany(Manually::class)->when(request()->has('manuallise:status'), function ($query) {
            $query->whereStatus(request('manuallise:status'));
        });
    }

    public function procurements()
    {
        return $this->hasManyThrough(Procurement::class,
            ProcurementPlan::class)->when(request()->has('procurement:status'), function ($query) {
            $query->whereStatus(request('procurement:status'));
        });
    }

    public function storage()
    {
        return $this->hasMany(Storage::class);
    }
}
