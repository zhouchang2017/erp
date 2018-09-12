<?php

namespace Chang\AmazonMws;

use Chang\AmazonMws\Nova\Amazon;
use Laravel\Nova\Nova;
use Laravel\Nova\Events\ServingNova;
use Illuminate\Support\Facades\Route;
use Illuminate\Support\ServiceProvider;
use Chang\AmazonMws\Http\Middleware\Authorize;

class ToolServiceProvider extends ServiceProvider
{
    /**
     * Bootstrap any application services.
     *
     * @return void
     */
    public function boot()
    {
        $this->loadViewsFrom(__DIR__.'/../resources/views', 'amazon-mws');

        $this->app->booted(function () {
            $this->routes();
        });

        $this->publishes([
            __DIR__.'/../config/amazon.php' => config_path('amazon.php'),
        ], 'config');

        if (! class_exists('CreateAmazonsTable')) {
            $timestamp = date('Y_m_d_His', time());
            $this->publishes([
                __DIR__.'/../database/migrations/2018_09_10_175454_create_amazons_table.php' => $this->app->databasePath()."/migrations/{$timestamp}_create_amazons_table.php",
            ], 'migrations');
        }

        if (! class_exists('CreateShippingAddressesTable')) {
            $timestamp = date('Y_m_d_His', time());
            $this->publishes([
                __DIR__.'/../database/migrations/2018_09_12_112150_create_shipping_addresses_table.php' => $this->app->databasePath()."/migrations/{$timestamp}_create_shipping_addresses_table.php",
            ], 'migrations');
        }

        if (! class_exists('CreateAmazonOrdersTable')) {
            $timestamp = date('Y_m_d_His', time());
            $this->publishes([
                __DIR__.'/../database/migrations/2018_09_12_113425_create_amazon_orders_table.php' => $this->app->databasePath()."/migrations/{$timestamp}_create_amazon_orders_table.php",
            ], 'migrations');
        }




        Nova::serving(function (ServingNova $event) {
            //
        });

        Nova::resources([
            Amazon::class,
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
                ->group(__DIR__.'/../routes/api.php');
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
