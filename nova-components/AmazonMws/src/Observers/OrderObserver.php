<?php
/**
 * Created by PhpStorm.
 * User: z
 * Date: 2018/10/8
 * Time: 4:46 PM
 */

namespace Chang\AmazonMws\Observers;

use App\Modules\Order\Contracts\OrderContract;
use App\Modules\Order\Services\OrderServer;

class OrderObserver
{
    protected $service;

    /**
     * OrderObserver constructor.
     * @param $service
     */
    public function __construct(OrderServer $service)
    {
        $this->service = $service;
    }

    public function created(OrderContract $order)
    {
        $this->service->createForAmazon($order);
    }
}