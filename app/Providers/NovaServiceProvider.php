<?php

namespace App\Providers;

use App\Modules\Channel\Dealpaw\Models\DealpawShippingAddress;
use App\Modules\Channel\Dealpaw\Observers\DealpawShippingAddressNovaObserver;
use App\Nova\Metrics\AllOrders;
use App\Nova\Metrics\NewOrders;
use App\Nova\Metrics\OrdersPerDay;
use App\Nova\Metrics\PendingProcurementPlans;
use Chang\AmazonMws\AmazonMws;
use Laravel\Nova\Nova;
use Laravel\Nova\Cards\Help;
use Illuminate\Support\Facades\Gate;
use Laravel\Nova\NovaApplicationServiceProvider;
use Chang\CreateProcurementPlan\CreateProcurementPlan;

class NovaServiceProvider extends NovaApplicationServiceProvider
{
    /**
     * Bootstrap any application services.
     *
     * @return void
     */
    public function boot()
    {
        parent::boot();

        // Nova相关的HTTP请求期间附加任何观察者
        Nova::serving(function () {
            DealpawShippingAddress::observe(DealpawShippingAddressNovaObserver::class);
        });
    }

    /**
     * Register the Nova routes.
     *
     * @return void
     */
    protected function routes()
    {
        Nova::routes()
            ->withAuthenticationRoutes()
            ->withPasswordResetRoutes()
            ->register();
    }

    /**
     * Register the Nova gate.
     *
     * This gate determines who can access Nova in non-local environments.
     *
     * @return void
     */
    protected function gate()
    {
        Gate::define('viewNova', function ($user) {
            return in_array($user->email, [
                //
            ]);
        });
    }

    /**
     * Get the cards that should be displayed on the Nova dashboard.
     *
     * @return array
     */
    protected function cards()
    {
        return [
//            new PendingProcurementPlans(),
            new NewOrders(),
            new OrdersPerDay(),
            new AllOrders()
        ];
    }

    /**
     * Get the tools that should be listed in the Nova sidebar.
     *
     * @return array
     */
    public function tools()
    {
        return [
            new CreateProcurementPlan,
            new CreateProcurementPlan('Manually'),
            new AmazonMws,
        ];
    }

    /**
     * Register any application services.
     *
     * @return void
     */
    public function register()
    {
        //
    }
}
