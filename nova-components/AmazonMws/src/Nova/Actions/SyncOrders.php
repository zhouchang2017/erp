<?php

namespace Chang\AmazonMws\Nova\Actions;

use Chang\AmazonMws\Jobs\SyncOrdersJob;
use Chang\AmazonMws\Services\AmazonService;
use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Laravel\Nova\Actions\Action;
use Illuminate\Support\Collection;
use Laravel\Nova\Fields\ActionFields;
use Illuminate\Queue\SerializesModels;
use Illuminate\Queue\InteractsWithQueue;

class SyncOrders extends Action implements ShouldQueue
{
    use InteractsWithQueue, Queueable, SerializesModels;

    public $onlyOnDetail = true;

    public $timeout = 4800;

    public function __construct()
    {
        $this->connection = 'redis-long-running';
        $this->queue = 'long-running-queue';
    }


    /**
     * Perform the action on the given models.
     *
     * @param  \Laravel\Nova\Fields\ActionFields $fields
     * @param  \Illuminate\Support\Collection $models
     * @return mixed
     */
    public function handle(ActionFields $fields, Collection $models)
    {
        $service = new AmazonService($models->first());
        $service->setMWS();
        $service->syncOrders();
        return Action::message('正在后台同步，大概需要20分钟左右');
    }

    /**
     * Get the fields available on the action.
     *
     * @return array
     */
    public function fields()
    {
        return [];
    }

}
