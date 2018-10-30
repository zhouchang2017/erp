<?php

namespace App\Nova;

use App\Nova\Fields\Images;
use App\Nova\Fields\Translatable;
use Chang\BelongsToManyAttribute\BelongsToManyAttribute;
use Chang\BelongsToManyOption\BelongsToManyOption;
use Laravel\Nova\Fields\BelongsToMany;
use Laravel\Nova\Fields\ID;
use Illuminate\Http\Request;
use Laravel\Nova\Http\Requests\NovaRequest;
use Laravel\Nova\Panel;
use R64\NovaFields\Text;

class DealpawProduct extends Resource
{
    /**
     * The model the resource corresponds to.
     *
     * @var string
     */
    public static $model = \App\Modules\DealpawProduct\Models\Product::class;

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
        'name',
        'code',
    ];

    public static $category = "Dealpaw";

    public function title()
    {
        return $this->model()->name;
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
            ID::make()->sortable()->hideFromDetail(),

            Images::make('Images')
                ->thumbnail('thumb')
                ->multiple()
                ->fullSize(),

            Text::make('Code')->rules(['required', 'max:255'])->hideFromIndex(),

            Translatable::make('Name')
                ->rules('required', 'max:255'),

            Translatable::make('Slug')->hideFromIndex(),

            Translatable::make('Short Description')->hideFromIndex(),

//            Translatable::make('Description')->trix()->hideFromIndex(),

            Translatable::make('Meta Title')->hideFromIndex(),

            Translatable::make('Meta Keywords')->hideFromIndex(),

            Translatable::make('Meta Description')->hideFromIndex(),

            BelongsToMany::make('Category', 'taxons', Taxon::class),

            new Panel('Attributes',[
                BelongsToManyAttribute::make('Attributes')->singleLine()->hideFromIndex(),
            ]),
            new Panel('Options',[
                BelongsToManyOption::make('Options')->hideFromIndex()
            ])
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
