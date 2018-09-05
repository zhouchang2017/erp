<?php

namespace App\Providers;

use App\Modules\Procurement\Models\Procurement;
use App\Modules\Procurement\Models\ProcurementPlan;
use App\Modules\Procurement\Models\ProcurementPlanProductVariant;
use App\Policies\ProcurementPlanPolicy;
use App\Policies\ProcurementPlanProductVariantPolicy;
use App\Policies\ProcurementPolicy;
use Illuminate\Support\Facades\Gate;
use Illuminate\Foundation\Support\Providers\AuthServiceProvider as ServiceProvider;

class AuthServiceProvider extends ServiceProvider
{
    /**
     * The policy mappings for the application.
     *
     * @var array
     */
    protected $policies = [
        Procurement::class => ProcurementPolicy::class,
        ProcurementPlan::class => ProcurementPlanPolicy::class,
        ProcurementPlanProductVariant::class => ProcurementPlanProductVariantPolicy::class,
    ];

    /**
     * Register any authentication / authorization services.
     *
     * @return void
     */
    public function boot()
    {
        $this->registerPolicies();

        //
    }
}
