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
use R64\NovaFields\JSON;

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
        'seller_sku',
    ];

    public static $category = "Amazon";

    public static $with = ['listing'];

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
            Avatar::make('Thumb', function () {
                $params = \Route::current()->parameters;
                return array_key_exists('resourceId',
                    $params) ? ProductAvatarField::getOriginAvatar($this->avatar) : $this->avatar;
            })->thumbnail(function () {
                $params = \Route::current()->parameters;
                return array_key_exists('resourceId',
                    $params) ? ProductAvatarField::getOriginAvatar($this->avatar) : $this->avatar;
            }),
            BelongsTo::make('Listing'),

            Text::make('SellerSKU', 'seller_sku'),

            Text::make('Asin'),

            Text::make('Fnsku')->hideFromIndex(),

            Number::make('In Stock Supply Quantity', 'in_stock_supply_quantity')->hideFromIndex(),

            Number::make('Total Quantity', 'total_supply_quantity')->sortable(),

            Text::make('Condition')->hideFromIndex(),

            Code::make('Earliest Availability', 'earliest_availability')->json()->hideFromIndex(),
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
