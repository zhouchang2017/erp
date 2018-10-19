<?php

namespace App\Nova\Metrics;

use App\Modules\Order\Models\Order;
use Illuminate\Http\Request;
use Laravel\Nova\Metrics\Partition;

class AllOrders extends Partition
{
    /**
     * Calculate the value of the metric.
     *
     * @param  \Illuminate\Http\Request $request
     * @return mixed
     */
    public function calculate(Request $request)
    {
        return $this->count($request, Order::class, 'orderable_type')
            ->label(function ($value) {
                switch ($value) {
                    case 'App\Modules\Channel\Dealpaw\Models\DealpawOrder':
                        return 'Dealpaw';
                    case 'Chang\AmazonMws\Models\Order':
                        return 'Amazon';
                    default:
                        return ucfirst($value);
                }
            });
    }

    /**
     * Determine for how many minutes the metric should be cached.
     *
     * @return  \DateTimeInterface|\DateInterval|float|int
     */
    public function cacheFor()
    {
        // return now()->addMinutes(5);
    }

    /**
     * Get the URI key for the metric.
     *
     * @return string
     */
    public function uriKey()
    {
        return 'all-orders';
    }
}
