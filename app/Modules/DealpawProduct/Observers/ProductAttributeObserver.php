<?php
/**
 * Created by PhpStorm.
 * User: z
 * Date: 2018/10/24
 * Time: 4:47 PM
 */

namespace App\Modules\DealpawProduct\Observers;


use App\Modules\DealpawProduct\Models\ProductAttribute;

class ProductAttributeObserver
{
    public function saving(ProductAttribute $attribute)
    {
        $attribute->position = $attribute->postion ?? 0;
    }
}