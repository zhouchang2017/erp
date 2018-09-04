<?php

namespace App\Modules\Procurement\Observers;

use App\Modules\Procurement\Enums\PlanStatus;
use App\Modules\Procurement\Models\ProcurementPlan;
use Illuminate\Support\Str;

class ProcurementPlanObserver
{

    public function creating(ProcurementPlan $plan)
    {
        $plan->setAttribute('code', $this->genCode());
    }

    public function created(ProcurementPlan $plan)
    {
//        $this->syncProductVariants($plan);
    }

    public function updated(ProcurementPlan $plan)
    {
        if ( !$plan->procurement && $plan->status === PlanStatus::getDescription(4)) {
            // Create Procurement
            $plan->createProcurement();
        }

    }

    public function afterUpdated(ProcurementPlan $plan)
    {
        $this->syncProductVariants($plan);
    }

    public function deleted(ProcurementPlan $plan)
    {

    }

    private function syncProductVariants(ProcurementPlan $plan)
    {
        if (request()->has('variants')) {
            $plan->variants()->sync(request()->input('variants'));
        }
        return $plan;
    }

    private function genCode()
    {
        return (string)Str::uuid();
    }


}