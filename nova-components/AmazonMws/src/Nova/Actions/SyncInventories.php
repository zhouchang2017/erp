<?php

namespace Chang\AmazonMws\Nova\Actions;

use Chang\AmazonMws\Services\AmazonService;
use Illuminate\Bus\Queueable;
use Illuminate\Http\Request;
use Laravel\Nova\Actions\Action;
use Illuminate\Support\Collection;
use Laravel\Nova\Fields\ActionFields;
use Illuminate\Queue\SerializesModels;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Contracts\Queue\ShouldQueue;
use Laravel\Nova\Fields\Text;

class SyncInventories extends Action implements ShouldQueue
{
    use InteractsWithQueue, Queueable, SerializesModels;

    public $onlyOnDetail = true;

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
        $service->syncInventory();
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
