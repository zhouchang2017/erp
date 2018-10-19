<?php

namespace Chang\AmazonMws\Nova;

use Fourstacks\NovaRepeatableFields\Repeater;
use Inspheric\Fields\Indicator;
use Laravel\Nova\Fields\Avatar;
use Laravel\Nova\Fields\Boolean;
use Laravel\Nova\Fields\Code;
use Laravel\Nova\Fields\Currency;
use Laravel\Nova\Fields\DateTime;
use Laravel\Nova\Fields\HasMany;
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

class Order extends Resource
{
    /**
     * The model the resource corresponds to.
     *
     * @var string
     */
    public static $model = \Chang\AmazonMws\Models\Order::class;

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
        'seller_order_id',
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

            Text::make('Amazon Order Id', 'amazon_order_id'),

            Text::make('Seller Order Id', 'seller_order_id')->hideFromIndex(),

            Indicator::make('Order Status', 'order_status')
                ->labels(
                    [
                        'PendingAvailability' => '预订订单已生成',
                        'Pending' => '订单已生成,但是付款未授权',
                        'Unshipped' => '订单已付款,等待发货',
                        'PartiallyShipped' => '部分商品已发货',
                        'Shipped' => '已发货',
                        'InvoiceUnconfirmed' => '已发货,发票为寄出',
                        'Canceled' => '订单已取消',
                        'Unfulfillable' => '订单无法进行配送',
                    ]
                )
                ->colors([
                    'PartiallyShipped' => 'indigo',
                    'PendingAvailability' => 'blue',
                    'Pending' => 'blue',
                    'Unshipped' => 'teal',
                    'Shipped' => 'green',
                    'InvoiceUnconfirmed' => 'green',
                    'Unfulfillable' => 'grey',
                    'Canceled' => 'grey',
                ]),

            Indicator::make('Fulfillment Channel', 'fulfillment_channel')
                ->labels([
                    'AFN' => '亚马逊配送',
                    'MFN' => '卖家自行配送',
                ]),

            Text::make('Ship Service Level', 'ship_service_level'),

            Currency::make('Amount', function () {
                return $this->order_total['amount'] ?? 'N/A';
            })->hideFromDetail(),

            JSON::make('Order Total', [
                Currency::make('Amount'),
                Text::make('Currency', 'currency_code'),
            ], 'order_total'),

            Number::make('Number Of Items Shipped', 'number_of_items_shipped')->hideFromIndex(),
            Number::make('Number Of Items Unshipped', 'number_of_items_unshipped')->hideFromIndex(),


            DateTime::make('Purchase Date', 'purchase_date')->hideFromIndex(),
            DateTime::make('LastUpdate Date', 'last_update_date'),

            Text::make('Marketplace Id', 'marketplace_id')->hideFromIndex(),

            HasMany::make('OrderItem', 'items', OrderItem::class),

            new Panel('Buyer Info', $this->buyerInfoPanel()),

            Text::make('Shipment Service Level Category', 'shipment_service_level_category'),

            DateTime::make('Earliest Ship Date', 'earliest_ship_date')->hideFromIndex(),
            DateTime::make('Latest Ship Date', 'last_ship_date')->hideFromIndex(),

            HasOne::make('ShippingAddress', 'shippingAddress', ShippingAddress::class),



        ];
    }

    public function buyerInfoPanel()
    {
        return [
            Text::make('Buyer Name', 'buyer_name')->hideFromIndex(),
            Text::make('Buyer Email', 'buyer_email')->hideFromIndex(),
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

    public static function label()
    {
        return 'AmazonOrders'; // TODO: Change the autogenerated stub
    }

    public static function singularLabel()
    {
        return 'AmazonOrder'; // TODO: Change the autogenerated stub
    }

    public static function uriKey()
    {
        return 'amazon-orders'; // TODO: Change the autogenerated stub
    }


}
