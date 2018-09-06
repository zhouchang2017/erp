<?php
/**
 * Created by PhpStorm.
 * User: z
 * Date: 2018/9/6
 * Time: 下午2:07
 */

namespace App\Modules\Warehouse\Contracts;

interface WarehouseStorageContract
{

    public function put();

    public function getWarehouseId();

    public function warehouse();

    public function getVariantList();

    public function histories();
}

//Warehouse->put(Procurement::find(1))