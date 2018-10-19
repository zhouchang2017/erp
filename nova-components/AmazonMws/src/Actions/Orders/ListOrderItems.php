<?php
/**
 * Created by PhpStorm.
 * User: z
 * Date: 2018/9/12
 * Time: 12:05 PM
 */

namespace Chang\AmazonMws\Actions\Orders;


use Chang\AmazonMws\Actions\Action;
use Chang\AmazonMws\Traits\ActionTrait;
use Illuminate\Support\Collection;

class ListOrderItems extends Action
{
    use ActionTrait;

    public function response($data = null): Collection
    {
        $response = parent::response($data);

        /** @var Collection $response */
        $response = $this->isNext() ?
            $response->get('ListOrderItemsByNextTokenResponse')->get('ListOrderItemsByNextTokenResult')
            : $response->get('ListOrderItemsResponse')->get('ListOrderItemsResult');

        /*
         * 处理一个订单下有多个商品的情况，让数据结构统一
         * */
        $orderItem = tap($response->get('OrderItems')->get('OrderItem'), function (&$orderItem) {
            if ($this->isAssocArray($orderItem->toArray())) {
                $orderItem = Collection::wrap([$orderItem]);
            };
        });
        return $response->put('OrderItems', collect(['OrderItem' => $orderItem]));
    }


}