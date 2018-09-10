<?php
/**
 * Created by PhpStorm.
 * User: z
 * Date: 2018/9/6
 * Time: 下午2:59
 */

namespace App\Modules\Warehouse\Traits;


use App\Modules\Warehouse\Contracts\WarehouseStorageContract;
use App\Modules\Warehouse\Models\StorageHistory;

trait WarehouseStorageTrait
{
    public function histories()
    {
        return $this->morphMany(StorageHistory::class, 'origin');
    }

    public function finished()
    {
        return $this->histories()->count() > 0;
    }

    public function getIsStorageAttribute()
    {
        return $this->histories()->count() > 0;
    }

    public function put()
    {
        /** @var WarehouseStorageContract $this */
        $this->warehouse->putStorage($this);
    }

    public function getWarehouseId()
    {
        return $this->warehouse->id;
    }

}