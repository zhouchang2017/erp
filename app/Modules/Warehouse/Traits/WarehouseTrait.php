<?php
/**
 * Created by PhpStorm.
 * User: z
 * Date: 2018/9/6
 * Time: 下午2:35
 */

namespace App\Modules\Warehouse\Traits;


use App\Modules\Warehouse\Contracts\WarehouseStorageContract;
use App\Modules\Warehouse\Models\Storage;

trait WarehouseTrait
{
    public function putStorage(WarehouseStorageContract $storageContract)
    {
        $warehouse = $storageContract->warehouse();
        $storageContract->getVariantList()->each(function ($item) use ($warehouse, $storageContract) {
            $item = array_merge($item, ['warehouse_id' => $warehouse->id]);

            tap($warehouse->storage()->whereProductVariantId($item['product_variant_id'])->first(),
                function ($old) use ($item, $warehouse) {
                    return $old ?
                        $this->incrementAttributes($item, $old) :
                        $warehouse->storage()->create($item);
                });
            $storageContract->histories()->create($item);

        });
    }

    private function vaildatorCanPut(WarehouseStorageContract $storageContract)
    {

    }

    public static function pullStorage(WarehouseStorageContract $storageContract)
    {

    }

    public function put()
    {

    }

    public function pull()
    {

    }

    /**
     * 更新库存
     * @param array $attribute
     * @param Storage $model
     * @return Storage
     */
    private function incrementAttributes(array $attribute, Storage $model)
    {
        $attribute = array_only($attribute, ['num', 'good', 'bad']);
        collect($attribute)->each(function ($attr, $key) use ($model) {
            $model->increment($key, $attr);
        });
        return $model;
    }

    private function writeHistory()
    {

    }
}