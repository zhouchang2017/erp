<?php
/**
 * Created by PhpStorm.
 * User: z
 * Date: 2018/9/11
 * Time: 下午6:48
 */

namespace Chang\AmazonMws\Actions\Orders;

use Chang\AmazonMws\Actions\Action;
use Chang\AmazonMws\Traits\ActionTrait;

class ListOrders extends Action
{
    use ActionTrait;

    public function getVersion(): string
    {
        return '2013-09-01';
    }
}