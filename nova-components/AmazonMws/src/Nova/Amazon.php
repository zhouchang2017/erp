<?php

namespace Chang\AmazonMws\Nova;

use Chang\AmazonMws\Nova\Actions\SyncInventories;
use Chang\AmazonMws\Nova\Actions\SyncListings;
use Chang\AmazonMws\Nova\Actions\SyncOrders;
use Fourstacks\NovaRepeatableFields\Repeater;
use Laravel\Nova\Actions\Actionable;
use Laravel\Nova\Fields\Boolean;
use Laravel\Nova\Fields\ID;
use Illuminate\Http\Request;
use Laravel\Nova\Fields\Text;
use Laravel\Nova\Fields\Textarea;
use Laravel\Nova\Http\Requests\NovaRequest;

class Amazon extends Resource
{
    /**
     * The model the resource corresponds to.
     *
     * @var string
     */
    public static $model = \Chang\AmazonMws\Models\Amazon::class;

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

            Text::make('Name'),

            Textarea::make('Description'),

            Repeater::make(__('Country'), 'country')
                ->addField([
                    'label' => __('Country'),
                    'placeholder' => __('Country'),
                    'name' => 'code',
                    'type' => 'select',
                    'options' => [
                        'ca' => __('Canada'),
                        'us' => __('United States'),
                        'de' => __('Germany'),
                        'es' => __('Spain'),
                        'fr' => __('France'),
                        'in' => __('India'),
                        'it' => __('Italy'),
                        'uk' => __('United Kingdom'),
                        'jp' => __('Japan'),
                        'cn' => __('China'),
                    ],
                ])->rules('required')->hideFromIndex(),

            Text::make('Seller ID', 'seller_id')
                ->creationRules('required', 'string')
                ->updateRules('nullable', 'string'),

//            Text::make('MWS Auth Token', 'mws_auth_token')
//                ->onlyOnForms()
//                ->creationRules('required', 'string')
//                ->updateRules('nullable', 'string'),

            Text::make('AWS Access Key Id', 'aws_access_key_id')
                ->onlyOnForms()
                ->creationRules('required', 'string')
                ->updateRules('nullable', 'string'),

            Text::make('Secret Key', 'secret_key')
                ->onlyOnForms()
                ->creationRules('required', 'string')
                ->updateRules('nullable', 'string'),

            Boolean::make('Enabled'),
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
            new SyncListings(),
            new SyncInventories(),
            new SyncOrders(),
        ];
    }
}
