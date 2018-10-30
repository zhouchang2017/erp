<?php

namespace App\Nova;

use App\Nova\Actions\SyncDealpawProducts;
use Fourstacks\NovaRepeatableFields\Repeater;
use Laravel\Nova\Fields\BelongsToMany;
use Laravel\Nova\Fields\HasMany;
use Laravel\Nova\Fields\ID;
use Illuminate\Http\Request;
use R64\NovaFields\Text;
use Laravel\Nova\Fields\Textarea;
use Laravel\Nova\Http\Requests\NovaRequest;
use R64\NovaFields\Boolean;
use R64\NovaFields\JSON;
use R64\NovaFields\Select;

class Dealpaw extends Resource
{
    /**
     * The model the resource corresponds to.
     *
     * @var string
     */
    public static $model = \App\Modules\Channel\Dealpaw\Models\Dealpaw::class;

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
        'name',
        'description',
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

            Text::make('Code')->rules('required', 'max:255',
                'unique:dealpaw.channels,code,{{resourceId}}')->hideFromIndex(),

            Text::make('Name')->rules('required', 'max:255'),

            Textarea::make('Description'),

            Text::make('Email')->rules('email'),

            Select::make('Locale Code')->options(
                $this->genSelectOptions(\App\Modules\Scaffold\Models\Locale::class)
            ),

            Select::make('Currency Code')->options(
                $this->genSelectOptions(\App\Modules\Channel\Dealpaw\Models\Currency::class)
            ),

            Boolean::make('Enabled'),

            BelongsToMany::make('Locales', 'locales', Locale::class),

            BelongsToMany::make('Currencies', 'currencies', Currency::class),
        ];
    }

    protected function genSelectOptions($model, $field = 'code')
    {
        return $model::pluck($field)->mapWithKeys(function ($value) {
            return [$value => mb_strtoupper($value)];
        });
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
//            new SyncDealpawProducts(),
        ];
    }
}
