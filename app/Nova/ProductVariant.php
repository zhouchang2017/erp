<?php

namespace App\Nova;

use Chang\AmazonMws\Nova\Listing;
use Laravel\Nova\Fields\Avatar;
use Laravel\Nova\Fields\BelongsTo;
use Laravel\Nova\Fields\BelongsToMany;
use Laravel\Nova\Fields\Boolean;
use Laravel\Nova\Fields\Currency;
use Laravel\Nova\Fields\HasMany;
use Laravel\Nova\Fields\ID;
use Illuminate\Http\Request;
use Laravel\Nova\Fields\Status;
use Laravel\Nova\Fields\Text;
use Laravel\Nova\Http\Requests\NovaRequest;
use Laravel\Nova\Panel;

class ProductVariant extends Resource
{
    /**
     * The model the resource corresponds to.
     *
     * @var string
     */
    public static $model = \App\Modules\Product\Models\ProductVariant::class;

    public static $category = "Product";
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
        'attribute_key',
    ];

    public static $with = ['product'];

    public function title()
    {
        return $this->model()->product->name . '-' . $this->model()->attribute_key;
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
            Avatar::make('Avatar', function () {
                return $this->model()->avatar;
            })->thumbnail(function (){
                return $this->model()->avatar;
            }),
            BelongsTo::make('Product', 'product'),
            Text::make('Sku'),
            Text::make('Attribute Key', 'attribute_key'),
            Currency::make('Price')->format('%.2n'),

            new Panel('Channels', $this->channels()),

            BelongsToMany::make('Product Providers', 'providers', ProductProvider::class)
                ->fields(function () {
                    return [
                        Currency::make('Price'),
                    ];
                }),
        ];
    }

    private function channels()
    {
        return [
            Boolean::make('Amazon Shop', function () {
                return $this->model()->on_amazon;
            }),

            Boolean::make('Dealpaw Shop', function () {
                return $this->model()->on_dealpaw;
            }),

            HasMany::make('Amazon', 'amazonVariants', Listing::class),

            HasMany::make('Dealpaw', 'dealpawVariants', DealpawProduct::class),
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
