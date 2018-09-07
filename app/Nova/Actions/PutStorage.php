<?php

namespace App\Nova\Actions;

use App\Modules\Procurement\Enums\ProcurementStatus;
use Illuminate\Bus\Queueable;
use Laravel\Nova\Actions\Action;
use Illuminate\Support\Collection;
use Laravel\Nova\Fields\ActionFields;
use Illuminate\Queue\SerializesModels;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Contracts\Queue\ShouldQueue;

class PutStorage extends Action
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
        $error = [];
        $models->each(function ($storageContract) use (&$error) {

            if ( !$storageContract->is_storage) {
                if ($storageContract->procurement_status !== ProcurementStatus::getDescription(3)) {
                    $error['msg'] = 'id:' . $storageContract->id . ' 该计划尚未完成，暂时无法入库！';
                    return false;
                }
                $storageContract->warehouse->putStorage($storageContract);
            } else {
                $error['msg'] = 'id:' . $storageContract->id . ' 请勿重复入库';
                return false;
            }

        });
        if (array_key_exists('msg', $error)) {
            return Action::danger($error['msg']);
        }
        return Action::message('入库成功');
    }

    /**
     * Get the fields available on the action.
     *
     * @return array
     */
    public function fields()
    {
        return [];
    }
}
