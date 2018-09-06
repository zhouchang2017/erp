<?php

namespace App\Modules\Procurement\Observers;

use App\Modules\Procurement\Enums\PaymentStatus;
use App\Modules\Procurement\Enums\ProcurementStatus;
use App\Modules\Procurement\Models\Procurement;

class ProcurementObserver
{

    public function creating(Procurement $procurement)
    {
        // 采购单创建默认为 等待发货 状态
        $procurement->setAttribute('procurement_status', ProcurementStatus::getDescription(1));
    }

    public function saving(Procurement $procurement)
    {
        if ($procurement->shipment && $procurement->procurement_status === ProcurementStatus::getDescription(1)) {
            $procurement->procurement_status = ProcurementStatus::getDescription(2);
            $procurement->shipment_at = now();
        }
        $ablePrice = (int)($procurement->able_price);
        $alreadyPrice = (int)($procurement->already_price);

        if ($ablePrice - $alreadyPrice === 0) {
            $procurement->payment_status = PaymentStatus::getDescription(1);
        }

        if ($alreadyPrice < $ablePrice && $alreadyPrice > 0) {
            $procurement->payment_status = PaymentStatus::getDescription(2);
        }

        if ($ablePrice - $alreadyPrice === $ablePrice) {
            $procurement->payment_status = PaymentStatus::getDescription(0);
        }

    }

}