<?php

namespace App\Nova;

use Chang\CreateProduct\CreateProduct;
use Ebess\AdvancedNovaMediaLibrary\Fields\Images;
use Laravel\Nova\Fields\Avatar;
use Laravel\Nova\Fields\BelongsTo;
use Laravel\Nova\Fields\Boolean;
use Laravel\Nova\Fields\HasMany;
use Laravel\Nova\Fields\ID;
use Illuminate\Http\Request;
use Laravel\Nova\Fields\Markdown;
use Laravel\Nova\Fields\Text;
use Laravel\Nova\Http\Requests\NovaRequest;
use R64\NovaImageCropper\ImageCropper;
use Storage;

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
            // 缩略图
//            ImageCropper::make('Image', 'image')->disk('qiniu')->delete(new DeleteAvatar)->hideFromIndex(),
            // 用户select左侧小图显示
            Avatar::make('Thumb', function () {
                return null;
            })->thumbnail(function () {
                return $this->avatar;
            })->hideFromDetail()->hideWhenUpdating(),
            // 产品图集
            Images::make('Media', 'product_image')// second parameter is the media collection name
//                ->thumbnail()// conversion used to display the image
            ->multiple()// enable upload of multiple images - also ordering
            ->fullSize()->hideFromIndex()->help('第一张图片为缩略图'),// full size column
            // validation rules for the collection of images

            Text::make('Code')
                ->sortable()
                ->rules('required', 'max:255')
                ->creationRules('unique:products,code')
                ->updateRules('unique:products,code,{{resourceId}}'),

            BelongsTo::make(__('ProductType'), 'type', ProductType::class),

            BelongsTo::make(__('Brand'), 'brand', Brand::class)->searchable(),

            Markdown::make('Body'),

            Boolean::make('Enabled')
                ->sortable()
                ->rules('required'),

            CreateProduct::make()
                ->withMeta(['typeId' => $this->model()->type_id, 'origin' => $this->getProductAttributes()]),

//            HasOne::make('ProductType', 'type'),

            HasMany::make(__('ProductVariant'), 'variants', ProductVariant::class),

//            HasOne::make('Brand', 'brand'),

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

    public static function label()
    {
        return __('Products');
    }

    public static function singularLabel()
    {
        return __('Product');
    }


}
