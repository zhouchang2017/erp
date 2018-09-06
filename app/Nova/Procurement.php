<?php

namespace App\Nova;

use App\Modules\Scaffold\Models\LogisticCompany;
use App\Nova\Actions\ShipmentProcurement;
use Fourstacks\NovaRepeatableFields\Repeater;
use Laravel\Nova\Fields\BelongsTo;
use Laravel\Nova\Fields\Currency;
use Laravel\Nova\Fields\DateTime;
use Laravel\Nova\Fields\HasMany;
use Laravel\Nova\Fields\ID;
use Illuminate\Http\Request;
use Laravel\Nova\Fields\Number;
use Laravel\Nova\Fields\Text;
use Laravel\Nova\Http\Requests\NovaRequest;
use Laravel\Nova\Panel;

class Procurement extends Resource
{
    /**
     * The model the resource corresponds to.
     *
     * @var string
     */
    public static $model = \App\Modules\Procurement\Models\Procurement::class;

    /**
     * The single value that should be used to represent the resource when being displayed.
     *
     * @var string
     */
    public static $title = 'id';

    /**
     * The columns that should be searched.
     *
     * @var array
     */
    public static $search = [
        'id',
    ];

    /**
     * Get the fields displayed by the resource.
     *
     * @param  \Illuminate\Http\Request $request
     * @return array
     */
    public function fields(Request $request)
    {
        return [
            ID::make()->sortable(),
            BelongsTo::make(__('Procurement Plan'), 'plan', ProcurementPlan::class),
            Currency::make(__('Total Price'), 'total_price')->format('%.2n')->resolveUsing(function ($pcs) {
                return (string)$pcs;
            }),
            Currency::make(__('Payable Price'), 'able_price')->format('%.2n')->resolveUsing(function ($pcs) {
                return (string)$pcs;
            }),
            Currency::make(__('Settled Price'), 'already_price')->format('%.2n')->resolveUsing(function ($pcs) {
                return (string)$pcs;
            }),
            Number::make(__('Total Pcs'), 'total_pcs')->resolveUsing(function ($pcs) {
                return (string)$pcs;
            }),
            Text::make(__('Procurement') . ' ' . __('Status'), 'procurement_status'),
            Text::make(__('Payment') . ' ' . __('Status'), 'payment_status'),


            DateTime::make(__('Possible Arrival At'), 'pre_arrived_at')->hideFromIndex(),

            DateTime::make(__('Arrived At'), 'arrived_at')->hideFromIndex(),

            DateTime::make(__('Created At'), 'created_at')->hideFromIndex(),
            DateTime::make(__('Updated At'), 'updated_at')->hideFromIndex(),

            HasMany::make(__('Procurement Plan Info'), 'planInfo', ProcurementPlanProductVariant::class),

            Text::make('Edit',function(){
               return "<router-link to='/'> 123</router-link>";
            })->asHtml(),

            new Panel(__('Shipment'), $this->shipmentPanel()),

        ];
    }

    protected function shipmentPanel()
    {
        $logisticCompany = LogisticCompany::all()->pluck('name', 'id');
        return [
            DateTime::make(__('Shipment At'), 'shipment_at')->hideFromIndex(),
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

    /**
     * Get the cards available for the request.
     *
     * @param  \Illuminate\Http\Request $request
     * @return array
     */
    public function cards(Request $request)
    {
        return [];
    }

    /**
     * Get the filters available for the resource.
     *
     * @param  \Illuminate\Http\Request $request
     * @return array
     */
    public function filters(Request $request)
    {
        return [];
    }

    /**
     * Get the lenses available for the resource.
     *
     * @param  \Illuminate\Http\Request $request
     * @return array
     */
    public function lenses(Request $request)
    {
        return [];
    }

    /**
     * Get the actions available for the resource.
     *
     * @param  \Illuminate\Http\Request $request
     * @return array
     */
    public function actions(Request $request)
    {
        return [
            new ShipmentProcurement,
        ];
    }
}
