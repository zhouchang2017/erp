<?php

namespace App\Nova;

use Chang\CreateProduct\CreateProduct;
use Chang\ProductAttributes\ProductAttributes;
use Laravel\Nova\Fields\BelongsTo;
use Laravel\Nova\Fields\Boolean;
use Laravel\Nova\Fields\ID;
use Illuminate\Http\Request;
use Laravel\Nova\Fields\Markdown;
use Laravel\Nova\Fields\Status;
use Laravel\Nova\Fields\Text;
use Laravel\Nova\Http\Requests\NovaRequest;

class Product extends Resource
{
    /**
     * The model the resource corresponds to.
     *
     * @var string
     */
    public static $model = \App\Modules\Product\Models\Product::class;

    /**
     * The single value that should be used to represent the resource when being displayed.
     *
     * @var string
     */
    public static $title = 'name';

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

            Text::make('Name')
                ->sortable()
                ->rules('required', 'max:255'),

            Text::make('NameCn','name_cn')
                ->sortable()
                ->rules('required', 'max:255')
                ->hideFromIndex(),

            Text::make('NameEn','name_en')
                ->sortable()
                ->rules('required', 'max:255')
                ->hideFromIndex(),

            Text::make('Code')
                ->sortable()
                ->rules('required', 'max:255')
                ->creationRules('unique:products,code')
                ->updateRules('unique:products,code,{{resourceId}}'),

            BelongsTo::make('ProductType','type'),

            BelongsTo::make('Brand','brand'),

            Markdown::make('Body'),

            Boolean::make('Enabled')
                ->sortable()
                ->rules('required'),

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
