<?php

namespace App\Modules\Procurement\Observers;

use App\Modules\Procurement\Enums\PlanStatus;
use App\Modules\Procurement\Models\ProcurementPlanProductVariant;

class ProcurementPlanProductVariantObserver
{
    public function saving(ProcurementPlanProductVariant $planProductVariant)
    {
        $planProductVariant->setAttribute('arrived_pcs', $this->calcArrivedPcs($planProductVariant));
    }

    public function updated(ProcurementPlanProductVariant $planProductVariant)
    {
        if ($planProductVariant->plan->already && $planProductVariant->plan->procurement) {

        };
    }


    /**
     * 计算已到货数量
     * @param ProcurementPlanProductVariant $planProductVariant
     * @return mixed
     */
    private function calcArrivedPcs(ProcurementPlanProductVariant $planProductVariant)
    {
        $good = $planProductVariant->good;
        $bad = $planProductVariant->bad;
        $lost = $planProductVariant->lost;
        return $good + $bad + $lost;
    }
}