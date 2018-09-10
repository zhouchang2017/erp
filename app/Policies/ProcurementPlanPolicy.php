<?php

namespace App\Policies;

use App\Modules\Procurement\Enums\PlanStatus;
use App\Modules\Procurement\Models\ProcurementPlan;
use App\User;
use Illuminate\Auth\Access\HandlesAuthorization;

class ProcurementPlanPolicy
{
    use HandlesAuthorization;

    /**
     * Create a new policy instance.
     *
     * @return void
     */
    public function __construct()
    {
        //
    }

    public function view()
    {
        return true;
    }

    public function create()
    {
        return false;
    }

    public function update(User $user, ProcurementPlan $plan)
    {
        return !in_array($plan->status, [PlanStatus::getDescription(3), PlanStatus::getDescription(4)]);
    }
}
