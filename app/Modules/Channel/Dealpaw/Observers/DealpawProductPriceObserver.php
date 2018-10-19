<?php
/**
 * Created by PhpStorm.
 * User: z
 * Date: 2018/10/10
 * Time: 10:08 AM
 */

namespace App\Modules\Channel\Dealpaw\Observers;


use App\Modules\Channel\Dealpaw\Models\DealpawProductPrice;
use App\Modules\Channel\Dealpaw\Services\DealpawService;

class DealpawProductPriceObserver
{
    public function updated(DealpawProductPrice $price)
    {
        (new DealpawService($price->dealpaw))->syncProductPriceToDealpaw($price);
    }
}