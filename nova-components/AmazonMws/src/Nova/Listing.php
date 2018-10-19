<?php

namespace Chang\AmazonMws\Nova;

use App\Nova\ProductVariant;
use Fourstacks\NovaRepeatableFields\Repeater;
use Laravel\Nova\Fields\Avatar;
use Laravel\Nova\Fields\BelongsTo;
use Laravel\Nova\Fields\Boolean;
use Laravel\Nova\Fields\Code;
use Laravel\Nova\Fields\Currency;
use Laravel\Nova\Fields\HasOne;
use Laravel\Nova\Fields\ID;
use Illuminate\Http\Request;
use Laravel\Nova\Fields\Number;
use Laravel\Nova\Fields\Password;
use Laravel\Nova\Fields\Text;
use Laravel\Nova\Fields\Textarea;
use Laravel\Nova\Http\Requests\NovaRequest;
use Laravel\Nova\Panel;
use R64\NovaFields\JSON;

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
        'sku',
    ];

    public static $category = "Amazon";

    public static $with = [];

    public function title()
    {
        $params = \Route::current()->parameters;
        return array_key_exists('resourceId', $params) ? $this->title : str_limit($this->title, 60);
    }

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
                $params = \Route::current()->parameters;
                return array_key_exists('resourceId',
                    $params) ? ProductAvatarField::getOriginAvatar($this->avatar) : $this->avatar;
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

            Number::make('FBA Stock', function () {
                return $this->model()->fba_stock;
            }),

            HasOne::make('Inventory'),

            BelongsTo::make('Relation Variant', 'localVariant', ProductVariant::class)->searchable()->hideFromIndex(),

            new Panel('Business Price', $this->businessPrice()),

            new Panel('Listing Props', $this->listingPropsFields()),
        ];
    }

    private function listingPropsFields()
    {
        return [
            Code::make('Props')->json(),

            Code::make('Variation Parent', 'variation_parent')->json(),

            Code::make('Sales Rank', 'sales_rank')->json(),
        ];
    }

    private function businessPrice()
    {
        return [
            Currency::make('Business Price', 'business_price')->displayUsing(function ($value) {
                return $value ?? 0;
            })->format('%.2n')->hideFromIndex(),
            JSON::make('Business Price Options', [
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

            ], 'business_options')->hideFromIndex(),
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
