<?php

namespace App\Nova;

use App\Nova\Actions\ShipmentDealpawOrder;
use Inspheric\Fields\Indicator;
use R64\NovaFields\BelongsTo;
use Laravel\Nova\Fields\DateTime;
use Laravel\Nova\Fields\HasMany;
use Laravel\Nova\Fields\ID;
use Illuminate\Http\Request;
use R64\NovaFields\Text;
use Laravel\Nova\Http\Requests\NovaRequest;

class DealpawOrder extends Resource
{
    /**
     * The model the resource corresponds to.
     *
     * @var string
     */
    public static $model = \App\Modules\Channel\Dealpaw\Models\DealpawOrder::class;

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

    public static $category = "Dealpaw";

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

            Text::make('Number')->readOnly(),

            Text::make('Total')->readOnly(),

            Text::make('Currency', 'currency_code')->readOnly(),

            Indicator::make('Order Status', 'state')
                ->labels(
                    [
                        'new' => '订单已生成,但是付款未授权',
                        'canceled' => '订单已取消',
                        'fulfilled' => '交易成功',
                    ]
                )
                ->colors([
                    'new' => 'orange',
                    'fulfilled' => 'green',
                    'canceled' => 'grey',
                ]),

            Indicator::make('Payment Status', 'payment_state')
                ->labels([
                    'checkout' => 'CHECKOUT',
                    'awaiting_payment' => '待付款',
                    'partially_paid' => '部分支付',
                    'cancelled' => '取消支付',
                    'paid' => '已支付',
                    'partially_refunded' => '部分退款',
                    'refunded' => '已退款',
                ])->colors([
                    'checkout' => 'grey',
                    'awaiting_payment' => 'blue',
                    'partially_paid' => 'teal',
                    'cancelled' => 'grey',
                    'paid' => 'green',
                    'partially_refunded' => 'orange',
                    'refunded' => 'red',
                ]),

            Indicator::make('Shipping Status', 'shipping_state')
                ->labels([
                    'checkout' => 'CHECKOUT',
                    'ready' => '待发货',
                    'cancelled' => '已取消',
                    'partially_shipped' => '部分发货',
                    'shipped' => '已发货',
                ])->colors([
                    'checkout' => 'grey',
                    'ready' => 'orange',
                    'cancelled' => 'grey',
                    'partially_shipped' => 'teal',
                    'shipped' => 'green',
                ]),

            Text::make('Payment Method', 'payment_method_name')->hideFromIndex()->readOnly(),

            Text::make('Coupon', 'coupon_name')->hideFromIndex()->readOnly(),

            BelongsTo::make('Address', 'address', DealpawShippingAddress::class)
                ->hideFromIndex()->readOnly(),

            HasMany::make('Items', 'items', DealpawOrderItem::class),

            DateTime::make('Paid At')->hideFromIndex(),

            DateTime::make('Confirmed At')->hideFromIndex(),

            DateTime::make('Reviewed At')->hideFromIndex(),

            DateTime::make('Fulfilled At')->hideFromIndex(),

            HasMany::make('Shipments', 'shipments', ShipmentDealpawOrderItem::class),

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
            new ShipmentDealpawOrder(),
        ];
    }
}
