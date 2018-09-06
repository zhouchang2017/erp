<?php
/**
 * Created by PhpStorm.
 * User: z
 * Date: 2018/9/6
 * Time: 下午2:59
 */

namespace App\Modules\Warehouse\Traits;


use App\Modules\Warehouse\Models\Warehouse;

trait WarehouseStorageTrait
{
    public function put()
    {

    }

    public function getWarehouseId()
    {
        return $this->warehouse->id;
    }

}