<?php

namespace Chang\AmazonMws\Nova;

use Fourstacks\NovaRepeatableFields\Repeater;
use Laravel\Nova\Fields\Avatar;
use Laravel\Nova\Fields\BelongsTo;
use Laravel\Nova\Fields\Code;
use Laravel\Nova\Fields\Currency;
use Laravel\Nova\Fields\ID;
use Illuminate\Http\Request;
use Laravel\Nova\Fields\Number;
use Laravel\Nova\Fields\Text;
use Laravel\Nova\Http\Requests\NovaRequest;
use R64\NovaJson\JSON;

class Inventory extends Resource
{
    /**
     * The model the resource corresponds to.
     *
     * @var string
     */
    public static $model = \Chang\AmazonMws\Models\Inventory::class;

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
        'asin',
    ];

    public static $with = ['listing'];

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
            Avatar::make('Thumb', function () {
                return $this->avatar;
            })->thumbnail(function () {
                return $this->avatar;
            }),
            Text::make('Title', function () {
                $params = \Route::current()->parameters;
                return array_key_exists('resourceId', $params) ? $this->title : str_limit($this->title, 50);
            }),
            Text::make('Sku'),
            Text::make('Asin'),
            Currency::make('Price'),
            Number::make('Quantity'),
            Currency::make('Business Price', 'business_price'),
            Json::make('Business Price Options', [
                Text::make('Quantity Price Type', 'quantity_price_type'),
                Text::make('Quantity Price 1', 'quantity_price1'),
                Text::make('Quantity Lower Bound 1', 'quantity_lower_bound1'),

                Text::make('Quantity Price 2', 'quantity_price2'),
                Text::make('Quantity Lower Bound 2', 'quantity_lower_bound2'),

                Text::make('Quantity Price 3', 'quantity_price3'),
                Text::make('Quantity Lower Bound 3', 'quantity_lower_bound3'),

                Text::make('Quantity Price 4', 'quantity_price4'),
                Text::make('Quantity Lower Bound 4', 'quantity_lower_bound4'),

                Text::make('Quantity Price 5', 'quantity_price5'),
                Text::make('Quantity Lower Bound 5', 'quantity_lower_bound5'),

            ], 'business_price_options'),

            BelongsTo::make('Listing'),
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
        return [];
    }
}
