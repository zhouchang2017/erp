<?php

namespace App\Nova;

use Chang\CreateProduct\CreateProduct;
use Ebess\AdvancedNovaMediaLibrary\Fields\Images;
use Laravel\Nova\Fields\BelongsTo;
use Laravel\Nova\Fields\Boolean;
use Laravel\Nova\Fields\HasMany;
use Laravel\Nova\Fields\HasOne;
use Laravel\Nova\Fields\ID;
use Illuminate\Http\Request;
use Laravel\Nova\Fields\Markdown;
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

    public static $category = "Product";
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

            Text::make('NameCn', 'name_cn')
                ->sortable()
                ->rules('required', 'max:255')
                ->hideFromIndex(),

            Text::make('NameEn', 'name_en')
                ->sortable()
                ->rules('required', 'max:255')
                ->hideFromIndex(),

            Images::make('Images', 'product_image')// second parameter is the media collection name
//                ->thumbnail()// conversion used to display the image
                ->multiple()// enable upload of multiple images - also ordering
                ->fullSize(),// full size column
                // validation rules for the collection of images

            Text::make('Code')
                ->sortable()
                ->rules('required', 'max:255')
                ->creationRules('unique:products,code')
                ->updateRules('unique:products,code,{{resourceId}}'),

            BelongsTo::make('ProductType', 'type'),

            BelongsTo::make('Brand', 'brand')->searchable(),

            Markdown::make('Body'),

            Boolean::make('Enabled')
                ->sortable()
                ->rules('required'),

            CreateProduct::make()
                ->withMeta(['typeId' => $this->model()->type_id, 'origin' => $this->getProductAttributes()]),

            HasOne::make('ProductType', 'type'),

            HasMany::make('ProductVariant', 'variants'),

            HasOne::make('Brand', 'brand'),

        ];
    }

    protected function getProductAttributes()
    {
        return $this->model()->with([
            'variants',
            'attributes.group',
            'attributes.attributeValue',
        ])->find($this->model()->id);
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
