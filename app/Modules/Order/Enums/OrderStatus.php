<?php

namespace App\Modules\Order\Enums;

use BenSampo\Enum\Enum;

final class OrderStatus extends Enum
{
    const PENDING = 0;              //等待买家付款
    const UNSHIPPED = 1;            //买家已付款，等待卖家发货
    const PARTIALLY_SHIPPED = 2;    //部分发货
    const SHIPPED = 3;              //已发货
    const CANCEL = 4;               //订单已取消
    const UNFULFILLABLE = 5;       // 订单无法进行配送

    /*
     * amazon order status
     *      PendingAvailability:
     *      只有预订订单才有此状态。订单已生成，但是付款未授权且商品的发售日期是将来的某一天。
     *      订单尚不能进行发货。请注意：仅在日本 (JP)，Preorder 才可能是一个 OrderType 值。
     *
     *      Pending => 等待买家付款
     *      订单已生成，但是付款未授权。订单尚不能进行发货。请注意：对于 OrderType = Standard 的订单，
     *      初始的订单状态是 Pending。对于 OrderType = Preorder 的订单（仅适用于 JP），
     *      初始的订单状态是 PendingAvailability，当进入付款授权流程时，订单状态将变为 Pending。
     *
     *      Unshipped => 买家已付款，等待卖家发货
     *      付款已经过授权，订单已准备好进行发货，但订单中商品尚未发运。
     *
     *      PartiallyShipped
     *      订单中的一个或多个（但并非全部）商品已经发货。
     *
     *      Shipped => 已发货
     *      订单中的所有商品均已发货。
     *
     *      InvoiceUnconfirmed:
     *      订单中的所有商品均已发货。但是卖家还没有向亚马逊确认已经向买家寄出发票。请注意：此参数仅适用于中国地区。
     *
     *      Canceled => 订单已取消
     *      订单已取消。
     *
     *      Unfulfillable:
     *      订单无法进行配送。该状态仅适用于通过亚马逊零售网站之外的渠道下达但由亚马逊进行配送的订单。
     * */

    /*
     * dealpaw order status
     *
     *      new => 等待买家付款
     *
     *      unshipped => 买家已付款，等待卖家发货
     *
     *      cancelled => 订单已取消
     *
     *      fulfilled => 已完成
     * */

    /**
     * Get the description for an enum value
     *
     * @param $value
     * @return string
     */
    public static function getDescription($value): string
    {
        return strtolower(self::getKey($value));
    }
}
