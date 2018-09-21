<?php

namespace Chang\AmazonMws;

use Chang\AmazonMws\Nova\Amazon;
use Chang\AmazonMws\Nova\Inventory;
use Chang\AmazonMws\Nova\Listing;
use Laravel\Nova\Nova;
use Laravel\Nova\Events\ServingNova;
use Illuminate\Support\Facades\Route;
use Illuminate\Support\ServiceProvider;
use Chang\AmazonMws\Http\Middleware\Authorize;
use Chang\AmazonMws\Models\Amazon as AmazonModel;

class ToolServiceProvider extends ServiceProvider
{

    protected $tables = [
        'CreateAmazonsTable' => '2018_09_10_175454_create_amazons_table',
        'CreateShippingAddressesTable' => '2018_09_12_112150_create_shipping_addresses_table',
        'CreateAmazonOrdersTable' => '2018_09_12_113425_create_amazon_orders_table',
        'CreateAmazonInventoriesTable' => '2018_09_17_161820_create_amazon_inventories_table',
        'CreateAmazonProductsTable' => '2018_09_17_175915_create_amazon_products_table',
    ];

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

        $this->publishMigrations();

        Nova::serving(function (ServingNova $event) {
            //
        });

        Nova::resources([
            Amazon::class,
            Inventory::class,
            Listing::class,
        ]);

        Nova::provideToScript([
            'locale' => config('app.locale'),
        ]);

    }

    private function publishMigrations()
    {
        collect($this->tables)->each(function ($path, $name) {
            if ( !class_exists($name)) {
                $fileName = preg_replace("/\d{4}_\d{2}_\d{2}_\d{6}/", date('Y_m_d_His', time()), $path);
                $this->publishes([
                    __DIR__ . '/../database/migrations/' . $path . '.sub' => $this->app->databasePath() . "/migrations/{$fileName}.php",
                ], 'migrations');
            }
        });
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
