<?php

namespace App\Modules\Procurement\Observers;

use App\Modules\Procurement\Models\Procurement;

class ProcurementObserver
{

    public function creating(Procurement $procurement)
    {
        // 采购单创建默认为 等待发货 状态
        $procurement->setAttribute('procurement_status', 'pending');
    }

}