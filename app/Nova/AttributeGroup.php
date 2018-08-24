<?php

namespace App\Nova;

use Chang\AttributeGroupAttributes\AttributeGroupAttributes;
use Laravel\Nova\Fields\BelongsToMany;
use Laravel\Nova\Fields\Boolean;
use Laravel\Nova\Fields\HasMany;
use Laravel\Nova\Fields\ID;
use Illuminate\Http\Request;
use Laravel\Nova\Fields\Select;
use Laravel\Nova\Fields\Text;
use Laravel\Nova\Http\Requests\NovaRequest;
use Laravel\Nova\Panel;

class AttributeGroup extends Resource
{
    /**
     * The model the resource corresponds to.
     *
     * @var string
     */
    public static $model = \App\Modules\Product\Models\AttributeGroup::class;

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

    public static $with = [
        'values',
        'types'
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
                ->rules('required', 'max:255')
                ->creationRules('unique:attribute_groups,name')
                ->updateRules('unique:attribute_groups,name,{{resourceId}}'),

            Boolean::make('Variant'),

            Select::make('Type')->options([
                'text' => 'Text',
                'textarea' => 'Textarea',
                'select' => 'Select',
                'richtext' => 'RichText',
                'checkbox_group' => 'CheckboxGroup',
                'radio_group' => 'RadioGroup',
                'toggle' => 'Toggle',
            ]),

            Boolean::make('Required'),

            new Panel('Attributes Information', $this->hasManyAttributes()),

            new Panel('Types Information', $this->belongsToManyTypes()),


        ];
//        'text','textarea','file','select','radio','richtext','checkbox','date','time','checkbox_group','radio_group','toggle'
    }


    protected function hasManyAttributes()
    {
        return [
            HasMany::make('Attribute', 'values'),
        ];
    }

    protected function belongsToManyTypes()
    {
        return [
          BelongsToMany::make('ProductTypes','types'),
        ];
    }

    protected function createOrUpdateAttributes()
    {
        return [
            AttributeGroupAttributes::make('Attributes')
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
