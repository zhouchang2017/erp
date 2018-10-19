<?php

namespace Chang\AmazonMws\Nova;


use Laravel\Nova\Fields\BelongsTo;
use Laravel\Nova\Fields\Currency;
use Laravel\Nova\Fields\DateTime;
use Laravel\Nova\Fields\ID;
use Illuminate\Http\Request;
use Laravel\Nova\Fields\Number;
use Laravel\Nova\Fields\Text;
use Laravel\Nova\Http\Requests\NovaRequest;
use R64\NovaFields\JSON;

class OrderItem extends Resource
{
    /**
     * The model the resource corresponds to.
     *
     * @var string
     */
    public static $model = \Chang\AmazonMws\Models\OrderItem::class;

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
        'amazon_order_id',
        'seller_sku',
        'asin',
    ];

    public static $category = "Amazon";

    public static $with = [];

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

            Text::make('Amazon Order Id', 'amazon_order_id')->hideFromIndex(),

            Text::make('Asin'),

            Text::make('Seller Sku', 'seller_sku'),

            Text::make('Order Item Id', 'order_item_id'),

            Text::make('Title')->displayUsing(function ($title) {
                $params = \Route::current()->parameters;
                return array_key_exists('resourceId', $params) ? $title : str_limit($title, 50);
            }),


            Currency::make('Amount', function () {
                return $this->item_price['amount'] ?? 'N/A';
            })->hideFromDetail(),

            JSON::make('Item Price', [
                Currency::make('Amount'),
                Text::make('Currency', 'currency_code'),
            ], 'item_price'),

            Number::make('Quantity Ordered', 'quantity_ordered')->hideFromIndex(),
            Number::make('Quantity Shipped', 'quantity_shipped')->hideFromIndex(),

            BelongsTo::make('Order'),
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
