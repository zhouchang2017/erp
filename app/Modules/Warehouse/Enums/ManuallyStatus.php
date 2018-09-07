<?php

namespace App\Modules\Procurement\Enums;

use BenSampo\Enum\Enum;

final class ManuallyStatus extends Enum
{
    const UNCOMMITTED = 0; //未提交
    const PENDING = 1;     //待审核
    const RETURN = 2;      //退回修改
    const FINISHED = 3;      //完成
    const CANCEL = 4;     //取消

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
