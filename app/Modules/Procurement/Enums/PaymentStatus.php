<?php

namespace App\Modules\Procurement\Enums;

use BenSampo\Enum\Enum;

final class PaymentStatus extends Enum
{
    const UNPAID = 0;       // 未支付
    const PAID = 1;         // 以支付
    const PART_PAID = 2;    // 部分支付
    const CANCEL = 3;       // 以取消支付


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
