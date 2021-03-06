<?php

namespace App\Nova;

use App\Rules\CheckArrivedProductNum;
use Laravel\Nova\Fields\BelongsTo;
use Laravel\Nova\Fields\Currency;
use Laravel\Nova\Fields\ID;
use Illuminate\Http\Request;
use Laravel\Nova\Fields\Number;
use Laravel\Nova\Http\Requests\NovaRequest;
use Laravel\Nova\Panel;

class ProcurementPlanProductVariant extends Resource
{
    /**
     * The model the resource corresponds to.
     *
     * @var string
     */
    public static $model = \App\Modules\Procurement\Models\ProcurementPlanProductVariant::class;

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

    public static $with = [
        'plan',
        'variant',
        'provider',
    ];

    public static $displayInNavigation = false;

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
//            BelongsTo::make('Procurement Plan ID', 'plan', ProcurementPlan::class),
            BelongsTo::make(__('Attribute'), 'variant', ProductVariant::class),
            Currency::make(__('Recommended Price'), 'price')->format('%.2n'),
            Currency::make(__('Purchasing Price'), 'offer_price')->format('%.2n'),
            BelongsTo::make(__('Product Provider'), 'provider', ProductProvider::class),

            new Panel('Arrived Info', $this->arrivedInfo($request)),
        ];
    }


    protected function arrivedInfo($request)
    {
        return [
            Number::make(__('Pcs'), 'pcs')->min(0)->step(1)->resolveUsing(function ($pcs) {
                return (string)$pcs;
            }),
            Number::make(__('Arrived Pcs'), 'arrived_pcs')->min(0)->step(1)->hideWhenUpdating(),

            Number::make(__('Arrived Good'), 'good')->min(0)->step(1)->resolveUsing(function ($good) {
                return (string)$good;
            })->rules('required', new CheckArrivedProductNum($request)),
            Number::make(__('Arrived Bad'), 'bad')->min(0)->step(1)->resolveUsing(function ($bad) {
                return (string)$bad;
            })->rules('required', new CheckArrivedProductNum($request)),
            Number::make(__('Arrived Lost'), 'lost')->min(0)->step(1)->resolveUsing(function ($lost) {
                return (string)$lost;
            })->rules('required', new CheckArrivedProductNum($request)),
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

        ];
    }
}
