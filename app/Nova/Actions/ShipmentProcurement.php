<?php

namespace App\Nova\Actions;

use App\Modules\Scaffold\Models\LogisticCompany;
use Fourstacks\NovaRepeatableFields\Repeater;
use Illuminate\Bus\Queueable;
use Laravel\Nova\Actions\Action;
use Illuminate\Support\Collection;
use Laravel\Nova\Fields\ActionFields;
use Illuminate\Queue\SerializesModels;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Contracts\Queue\ShouldQueue;

/**
 * 采购单发货动作
 * Class ShipmentProcurement
 * @package App\Nova\Actions
 */
class ShipmentProcurement extends Action
{
    use InteractsWithQueue, Queueable, SerializesModels;


    /**
     * Perform the action on the given models.
     *
     * @param  \Laravel\Nova\Fields\ActionFields $fields
     * @param  \Illuminate\Support\Collection $models
     * @return mixed
     */
    public function handle(ActionFields $fields, Collection $models)
    {

    }

    /**
     * Get the fields available on the action.
     *
     * @return array
     */
    public function fields()
    {
        $logisticCompany = LogisticCompany::all()->pluck('name', 'id');
        return [
            Repeater::make(__('Shipment'), 'shipment')
                ->addField([
                    'label' => __('Shipment Num'),
                    'placeholder' => __('Shipment Num'),
                    'name' => 'num',
                ])->addField([
                    'label' => __('Logistics company'),
                    'placeholder' => __('Logistics company'),
                    'name' => 'company',
                    'type' => 'select',
                    'options' => $logisticCompany,
                ])->rules('required'),
        ];
    }
}
