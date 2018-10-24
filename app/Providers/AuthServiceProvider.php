<?php

namespace App\Providers;

use App\Modules\Channel\Dealpaw\Models\DealpawOrder;
use App\Modules\Channel\Dealpaw\Models\DealpawOrderItem;
use App\Modules\Procurement\Models\Procurement;
use App\Modules\Procurement\Models\ProcurementPlan;
use App\Modules\Procurement\Models\ProcurementPlanProductVariant;
use App\Modules\Warehouse\Models\Manually;
use App\Policies\DealpawOrderItemPolicy;
use App\Policies\DealpawOrderPolicy;
use App\Policies\ManuallyPolicy;
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
        Manually::class => ManuallyPolicy::class,
        DealpawOrder::class => DealpawOrderPolicy::class,
        DealpawOrderItem::class => DealpawOrderItemPolicy::class,
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
