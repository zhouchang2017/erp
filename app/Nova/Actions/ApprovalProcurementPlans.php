<?php

namespace App\Nova\Actions;

use App\Modules\Procurement\Services\ProcurementServer;
use Illuminate\Bus\Queueable;
use Laravel\Nova\Actions\Action;
use Illuminate\Support\Collection;
use Laravel\Nova\Fields\ActionFields;
use Illuminate\Queue\SerializesModels;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Contracts\Queue\ShouldQueue;
use Laravel\Nova\Fields\Select;
use Laravel\Nova\Fields\Text;

class ApprovalProcurementPlans extends Action
{
    use InteractsWithQueue, Queueable, SerializesModels;


    /**
     * Perform the action on the given models.
     *
     * @param  \Laravel\Nova\Fields\ActionFields $fields
     * @param  \Illuminate\Support\Collection $models
     * @return mixed
     */
    public function handle(ActionFields $fields, Collection $models)
    {
        $attribute = $fields->toArray();
        $models->each(function ($model) use ($attribute) {
            app(ProcurementServer::class)->approval($model, $attribute);
        });
        return Action::message($attribute['status'] . 'success!!');
    }

    /**
     * Get the fields available on the action.
     *
     * @return array
     */
    public function fields()
    {
        return [
            Text::make('Info'),
            Select::make('Status')
                ->options([
                    'return' => '退回修改',
                    'cancel' => '取消采购',
                    'already' => '同意下单',
                ]),
        ];
    }
}
