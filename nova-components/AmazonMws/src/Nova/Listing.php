<?php

namespace Chang\AmazonMws\Nova;

use Fourstacks\NovaRepeatableFields\Repeater;
use Laravel\Nova\Fields\Avatar;
use Laravel\Nova\Fields\Boolean;
use Laravel\Nova\Fields\Code;
use Laravel\Nova\Fields\Currency;
use Laravel\Nova\Fields\HasOne;
use Laravel\Nova\Fields\ID;
use Illuminate\Http\Request;
use Laravel\Nova\Fields\Password;
use Laravel\Nova\Fields\Text;
use Laravel\Nova\Fields\Textarea;
use Laravel\Nova\Http\Requests\NovaRequest;

class Listing extends Resource
{
    /**
     * The model the resource corresponds to.
     *
     * @var string
     */
    public static $model = \Chang\AmazonMws\Models\Listing::class;

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

    public static $with = ['inventory'];

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

            Avatar::make('Thumb', 'avatar')->thumbnail(function () {
                return $this->avatar;
            }),
            Text::make('Title')->displayUsing(function ($title) {
                $params = \Route::current()->parameters;
                return array_key_exists('resourceId', $params) ? $title : str_limit($title, 50);
            }),

            Currency::make('Price', function () {
                return $this->price;
            }),

            Text::make('Sku'),

            Text::make('Asin')->hideFromIndex(),

            Text::make('Marketplace Id', 'marketplace_id')->hideFromIndex(),

            Text::make('Binding')->hideFromIndex(),

            Text::make('Brand'),

            Text::make('Color')->hideFromIndex(),

            Text::make('Part Number', 'part_number')->hideFromIndex(),

            Text::make('Product Group', 'product_group')->hideFromIndex(),

            Text::make('Product Type Name', 'product_type_name'),

            Code::make('Props')->json(),

            Code::make('Variation Parent', 'variation_parent')->json(),

            Code::make('Sales Rank', 'sales_rank')->json(),

            HasOne::make('Inventory'),
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
