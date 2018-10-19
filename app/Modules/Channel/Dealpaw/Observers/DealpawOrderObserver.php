<?php
/**
 * Created by PhpStorm.
 * User: z
 * Date: 2018/10/10
 * Time: 10:08 AM
 */

namespace App\Modules\Channel\Dealpaw\Observers;


use App\Modules\Channel\Dealpaw\Models\DealpawOrder;

class DealpawOrderObserver
{
    protected $price;

    public function updated(DealpawOrder $dealpawOrder)
    {
        // 同步更新orders表状态
        $order = $dealpawOrder->morphOrder;
        $order->order_status = $dealpawOrder->toStatus();
        $order->save();
    }
}