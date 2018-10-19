<?php

namespace App\Nova;

use App\Nova\Metrics\AllOrders;
use App\Nova\Metrics\NewOrders;
use App\Nova\Metrics\OrdersPerDay;
use Inspheric\Fields\Indicator;
use Laravel\Nova\Fields\DateTime;
use Laravel\Nova\Fields\ID;
use Illuminate\Http\Request;
use Laravel\Nova\Fields\MorphTo;
use Laravel\Nova\Http\Requests\NovaRequest;

class Order extends Resource
{
    /**
     * The model the resource corresponds to.
     *
     * @var string
     */
    public static $model = \App\Modules\Order\Models\Order::class;

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
            MorphTo::make('Orderable'),
            Indicator::make('Order Status')
                ->labels(
                    [
                        'pending' => '待付款',
                        'unshipped' => '待发货',
                        'partially_shipped' => '部分发货',
                        'shipped' => '已发货',
                        'canceled' => '订单已取消',
                        'unfulfillable' => '无法配送(AMAZON FBA)',
                    ]
                )
                ->colors([
                    'pending' => 'grey',
                    'unshipped' => 'orange',
                    'partially_shipped' => 'teal',
                    'shipped' => 'green',
                    'canceled' => 'grey',
                    'unfulfillable' => 'red',
                ]),

            DateTime::make('Created At'),
            DateTime::make('Updated At'),
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
        return [
            new NewOrders(),
            new OrdersPerDay(),
            new AllOrders()
        ];
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
