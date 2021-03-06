<?php

namespace App\Nova;

use App\Nova\Actions\ApprovalProcurementPlans;
use App\Nova\Lenses\PendingProcurementPlans;
use Chang\StorageSelectProduct\StorageSelectProduct;
use Inspheric\Fields\Indicator;
use Laravel\Nova\Fields\BelongsTo;
use Laravel\Nova\Fields\BelongsToMany;
use Laravel\Nova\Fields\HasMany;
use Laravel\Nova\Fields\ID;
use Illuminate\Http\Request;
use Laravel\Nova\Fields\Select;
use Laravel\Nova\Fields\Status;
use Laravel\Nova\Fields\Text;
use Laravel\Nova\Fields\Textarea;
use Laravel\Nova\Http\Requests\NovaRequest;

class ProcurementPlan extends Resource
{
    /**
     * The model the resource corresponds to.
     *
     * @var string
     */
    public static $model = \App\Modules\Procurement\Models\ProcurementPlan::class;

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
            BelongsTo::make('Warehouse'),

            BelongsTo::make('User'),

            Textarea::make('Description'),

            Textarea::make('Comment'),

            StorageSelectProduct::make('Products'),

            HasMany::make('InFo', 'planInfo', ProcurementPlanProductVariant::class),

            Indicator::make('Status')
                ->labels(
                    [
                        'uncommitted' => 'Uncommitted',
                        'pending' => 'Pending',
                        'return' => 'Return',
                        'already' => 'Already',
                        'cancel' => 'Cancel',
                    ]
                )
                ->colors([
                    'uncommitted' => 'red',
                    'pending' => 'blue',
                    'return' => 'yellow',
                    'already' => 'green',
                    'cancel' => 'grey',
                ]),
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
        return [
        ];
    }

    /**
     * Get the filters available for the resource.
     *
     * @param  \Illuminate\Http\Request $request
     * @return array
     */
    public function filters(Request $request)
    {
        return [

        ];
    }

    /**
     * Get the lenses available for the resource.
     *
     * @param  \Illuminate\Http\Request $request
     * @return array
     */
    public function lenses(Request $request)
    {
        return [
            new PendingProcurementPlans(),
        ];
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
            (new ApprovalProcurementPlans)->canSee(function ($request) {
                return true;
            })->canRun(function ($request, $user) {
                return true;
            }),
        ];
    }

    public static function label()
    {
        return __('ProcurementPlans');
    }

    public static function singularLabel()
    {
        return __('ProcurementPlan');
    }


}
