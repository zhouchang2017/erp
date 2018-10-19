<?php

namespace App\Nova\Actions;

use App\Modules\Channel\Dealpaw\Services\DealpawService;
use Illuminate\Bus\Queueable;
use Laravel\Nova\Actions\Action;
use Illuminate\Support\Collection;
use Laravel\Nova\Fields\ActionFields;
use Illuminate\Queue\SerializesModels;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Contracts\Queue\ShouldQueue;
use R64\NovaFields\Text;

class ShipmentDealpawOrder extends Action
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
        $models->each(function ($model) use ($fields) {
            (new DealpawService($model->dealpaw))->shipment($model, $fields->get('tracking_number'));
        });
    }

    /**
     * Get the fields available on the action.
     *
     * @return array
     */
    public function fields()
    {
        return [
            Text::make('Tracking Number', 'tracking_number')
                ->placeholder('E邮宝物流单号'),
        ];
    }
}
