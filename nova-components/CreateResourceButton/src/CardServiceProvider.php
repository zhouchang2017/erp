<?php

namespace Chang\CreateResourceButton;

use Laravel\Nova\Nova;
use Laravel\Nova\Events\ServingNova;
use Illuminate\Support\Facades\Route;
use Illuminate\Support\ServiceProvider;

class CardServiceProvider extends ServiceProvider
{
    /**
     * Bootstrap any application services.
     *
     * @return void
     */
    public function boot()
    {
        $this->app->booted(function () {
            $this->routes();
        });

        Nova::serving(function (ServingNova $event) {
            Nova::script('create-resource-button', __DIR__ . '/../dist/js/card.js');
            Nova::style('create-resource-button', __DIR__ . '/../dist/css/card.css');

            Nova::provideToScript([
                'customCreateResourceButtonConfig' => [
                    'procurement-plans' => [
                        'url' => ['name' => 'create-procurement-plan'],
                    ],
                    'manuallies' => [
                        'url' => ['name' => 'create-manuallies'],
                    ],
                ],
            ]);
        });
    }

    /**
     * Register the card's routes.
     *
     * @return void
     */
    protected function routes()
    {
        if ($this->app->routesAreCached()) {
            return;
        }

        Route::middleware(['nova'])
            ->prefix('nova-vendor/create-resource-button')
            ->group(__DIR__ . '/../routes/api.php');
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
