<?php
/**
 * Created by PhpStorm.
 * User: z
 * Date: 2018/10/10
 * Time: 10:08 AM
 */

namespace App\Modules\Channel\Dealpaw\Observers;


use App\Modules\Channel\Dealpaw\Models\DealpawProduct;

class DealpawProductObserver
{
    protected $price;

    public function updated(DealpawProduct $product)
    {
        $product->syncToDealpaw();
    }
}