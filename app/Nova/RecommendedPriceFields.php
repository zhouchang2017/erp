<?php
/**
 * Created by PhpStorm.
 * User: z
 * Date: 2018/9/10
 * Time: 上午10:33
 */

namespace App\Nova;


use Laravel\Nova\Fields\BelongsTo;
use Laravel\Nova\Fields\Currency;

class RecommendedPriceFields
{
    public function __invoke()
    {
        return [
            BelongsTo::make(__('Attribute'), 'variant', ProductVariant::class),
            Currency::make(__('Recommended Price'), 'price')->format('%.2n'),
            Currency::make(__('Purchasing Price'), 'offer_price')->format('%.2n'),
            BelongsTo::make(__('Product Provider'), 'provider', ProductProvider::class),
        ];
    }
}