<?php

namespace Chang\AmazonMws;

use Chang\AmazonMws\Nova\Order as AmazonOrder;
use Chang\AmazonMws\Nova\Amazon;
use Chang\AmazonMws\Nova\Inventory;
use Chang\AmazonMws\Nova\Listing;
use Chang\AmazonMws\Nova\OrderItem;
use Chang\AmazonMws\Nova\ShippingAddress;
use Laravel\Nova\Nova;
use Laravel\Nova\Events\ServingNova;
use Illuminate\Support\Facades\Route;
use Illuminate\Support\ServiceProvider;
use Chang\AmazonMws\Http\Middleware\Authorize;
use Chang\AmazonMws\Models\Amazon as AmazonModel;

class ToolServiceProvider extends ServiceProvider
{

    /**
     * Bootstrap any application services.
     *
     * @return void
     */
    public function boot()
    {
        $this->loadViewsFrom(__DIR__ . '/../resources/views', 'amazon-mws');

        $this->app->booted(function () {
            $this->routes();
        });

        $this->publishes([
            __DIR__ . '/../config/amazon.php' => config_path('amazon.php'),
        ], 'config');

//        $this->publishMigrations();

        Nova::serving(function (ServingNova $event) {
            //
        });

        $this->loadMigrationsFrom(__DIR__ . '/../database/migrations/');

        Nova::resources([
            Amazon::class,
            Inventory::class,
            Listing::class,
            AmazonOrder::class,
            ShippingAddress::class,
            OrderItem::class,
        ]);

        Nova::provideToScript([
            'locale' => config('app.locale'),
        ]);

    }

    /**
     * Register the tool's routes.
     *
     * @return void
     */
    protected function routes()
    {
        if ($this->app->routesAreCached()) {
            return;
        }

        Route::middleware(['nova', Authorize::class])
            ->prefix('nova-vendor/amazon-mws')
            ->group(__DIR__ . '/../routes/api.php');

        Route::model('amazon', AmazonModel::class);
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
