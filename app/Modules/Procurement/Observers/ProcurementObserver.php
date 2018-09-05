<?php

namespace App\Modules\Procurement\Observers;

use App\Modules\Procurement\Enums\ProcurementStatus;
use App\Modules\Procurement\Models\Procurement;

class ProcurementObserver
{

    public function creating(Procurement $procurement)
    {
        // 采购单创建默认为 等待发货 状态
        $procurement->setAttribute('procurement_status', 'pending');
    }

    public function saving(Procurement $procurement)
    {
        if ($procurement->shipment && $procurement->procurement_status === ProcurementStatus::getDescription(1)) {
            $procurement->procurement_status = ProcurementStatus::getDescription(2);
            $procurement->shipment_at = now();
        }
    }

}