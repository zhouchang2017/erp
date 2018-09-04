<?php

namespace App\Modules\Procurement\Enums;

use BenSampo\Enum\Enum;

final class ProcurementStatus extends Enum
{
    const PART_FINISHED = 0; // 未全部到货
    const PENDING = 1;       // 等待发货
    const SENDING = 2;       // 途中
    const FINISHED = 3;      // 全部到货
    const CANCEL = 4;        // 作废

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
