<?php

namespace App\Providers;

use Illuminate\Support\ServiceProvider;
use Spatie\MediaLibrary\FileAdder\FileAdder;
use Spatie\MediaLibrary\Filesystem\Filesystem;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Bootstrap any application services.
     *
     * @return void
     */
    public function boot()
    {
        setlocale(LC_MONETARY, 'en_US');
    }

    /**
     * Register any application services.
     *
     * @return void
     */
    public function register()
    {
        $this->app->bind(Filesystem::class, \App\Modules\Scaffold\Filesystem\Filesystem::class);
        $this->app->bind(FileAdder::class, \App\Modules\Scaffold\Filesystem\FileAdder::class);
    }
}
