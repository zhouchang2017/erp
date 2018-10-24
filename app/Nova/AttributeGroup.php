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
use YesWeDev\Nova\Translatable\Translatable;

class AttributeGroup extends Resource
{
    /**
     * The model the resource corresponds to.
     *
     * @var string
     */
    public static $model = \App\Modules\Product\Models\AttributeGroup::class;

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

    public static $with = [
        'values',
        'types',
        'translations'
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

            Translatable::make('Name')
                ->rules('required', 'max:255')
                ->creationRules('unique:attribute_group_translations,name')
                ->updateRules('unique:attribute_group_translations,name'),

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
            $this->addAttributeRelationField(),
            BelongsToMany::make(__('ProductTypes'), 'productTypes', ProductType::class),
        ];
//        'text','textarea','file','select','radio','richtext','checkbox','date','time','checkbox_group','radio_group','toggle'
    }

    protected function addAttributeRelationField()
    {
        $canAttribute = array_key_exists('resourceId',
                \Route::current()->parameters) && $this->model()->canOptions;
        return $this->mergeWhen($canAttribute, [
            HasMany::make(__('Attribute'), 'values', Attribute::class),
        ]);
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

    public static function singularLabel()
    {
        return __('AttributeGroup');
    }

    public static function label()
    {
        return __('AttributeGroups');
    }


}
