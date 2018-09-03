<?php

namespace App\Modules\Procurement\Services;


use App\Modules\Procurement\Models\Procurement;
use App\Modules\Procurement\Models\ProcurementPlan;
use DB;
use Log;

class ProcurementServer
{
    protected $procurementPlan;
    protected $procurement;
    protected $debug;

    /**
     * ProcurementServer constructor.
     * @param $procurementPlan
     * @param $procurement
     */
    public function __construct(ProcurementPlan $procurementPlan, Procurement $procurement)
    {
        $this->procurementPlan = $procurementPlan;
        $this->procurement = $procurement;
        $this->debug = config('app.debug');
    }

    public function createPlan(array $attributes)
    {
        try {
            DB::beginTransaction();
            $this->storePlan($attributes);
            $this->storePlanInfo($attributes);
            DB::commit();
        } catch (\Exception $exception) {
            DB::rollBack();
            if ($this->debug) {
                dd($exception);
            }
            Log::error('创建采购计划失败: ' . $exception->getMessage() . '');
        }
    }

    private function storePlan(array $attributes)
    {
        /*
         * create plan
         * attributes['warehouse_id']
         * attributes['user_id']
         * attributes['description']
         * attributes['comment'][['user_id'=>1,'text'=>'first comment']]
         * attributes['history']
         * */
        $this->procurementPlan = $this->procurementPlan::create($attributes);
    }

    /**
     * @param array $attributes
     * @throws \Exception
     */
    private function storePlanInfo(array $attributes)
    {
        /*
         * create planProductVariant
         * attributes['variants']
         * */

        $planInfo = array_get($attributes, 'variants');
        if ( !$planInfo) {
            throw new \Exception('采购计划必须存在商品');
        }
        $this->procurementPlan->planInfo()->createMany($planInfo);
    }

    public function approval(ProcurementPlan $model, array $attribute)
    {
        try {
            $history = $model->history ?? [];
            $model->history = array_push($history,
                [
                    'info' => $attribute['info'] ?? $attribute['status'],
                ]);
            $model->status = $attribute['status'];
            $model->save();
        } catch (\Exception $exception) {
            if ($this->debug) {
                dd($exception);
            }
        }

    }
}