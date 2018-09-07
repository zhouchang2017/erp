<?php
/**
 * Created by PhpStorm.
 * User: z
 * Date: 2018/9/6
 * Time: 下午2:43
 */

namespace App\Modules\Warehouse\Traits;


use App\Modules\Warehouse\Models\StorageHistory;

trait StorageHistoryTrait
{
    public function histories()
    {
        return $this->morphMany(StorageHistory::class, 'origin');
    }

    public function getIsStorageAttribute()
    {
        return $this->histories()->count() > 0;
    }
}