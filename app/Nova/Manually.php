<?php

namespace App\Nova;

use App\Nova\Actions\ApprovalManually;
use Inspheric\Fields\Indicator;
use Laravel\Nova\Fields\BelongsTo;
use Laravel\Nova\Fields\Boolean;
use Laravel\Nova\Fields\HasMany;
use Laravel\Nova\Fields\ID;
use Illuminate\Http\Request;
use Laravel\Nova\Fields\Text;
use Laravel\Nova\Fields\Textarea;
use Laravel\Nova\Http\Requests\NovaRequest;

class Manually extends Resource
{
    /**
     * The model the resource corresponds to.
     *
     * @var string
     */
    public static $model = \App\Modules\Warehouse\Models\Manually::class;

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

            BelongsTo::make(__('Salesman'), 'user', User::class),

            BelongsTo::make(__('Warehouse'), 'warehouse', Warehouse::class),

            HasMany::make(__('Manually Info'), 'manuallyInfo', ManuallyProductVariant::class),

            Indicator::make('Status')
                ->labels(
                    [
                        'uncommitted' => 'Uncommitted',
                        'pending' => 'Pending',
                        'return' => 'Return',
                        'finished' => 'Finished',
                        'cancel' => 'Cancel',
                    ]
                )
                ->colors([
                    'uncommitted' => 'red',
                    'pending' => 'blue',
                    'return' => 'yellow',
                    'finished' => 'green',
                    'cancel' => 'grey',
                ]),
            Textarea::make(__('Description'), 'description')->hideFromIndex(),

            Boolean::make(__('Warehousing'), function () {
                return $this->is_storage;
            }),

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
        return [
            new ApprovalManually
        ];
    }
}
