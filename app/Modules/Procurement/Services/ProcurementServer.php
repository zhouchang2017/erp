<?php

namespace App\Modules\Procurement\Services;


use App\Modules\Procurement\Models\Procurement;
use App\Modules\Procurement\Models\ProcurementPlan;
use App\Modules\Procurement\Models\ProcurementPlanProductVariant;
use App\Modules\Scaffold\Traits\HelperTrait;
use App\Notifications\ApprovalProcurementPlan;
use DB;
use Log;

class ProcurementServer
{
    use HelperTrait;

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

    /**
     * @param ProcurementPlan $procurementPlan
     * @return ProcurementServer
     */
    public function setProcurementPlan(ProcurementPlan $procurementPlan)
    {
        $this->procurementPlan = $procurementPlan;
        return $this;
    }

    public function createPlan(array $attributes)
    {
        try {
            DB::beginTransaction();
            $this->createProcurementPlan($attributes);
            $this->updateOrCreatePlanInfo($attributes);
            DB::commit();
        } catch (\Exception $exception) {
            DB::rollBack();
            if ($this->debug) {
                dd($exception);
            }
            Log::error('创建采购计划失败: ' . $exception->getMessage() . '');
        }
    }

    /**
     * @param $id
     * @param array $attributes
     */
    public function updatePlan($id, array $attributes)
    {
        try {
            DB::beginTransaction();
            $this->setProcurementPlan($this->procurementPlan::findOrFail($id));
            $this->procurementPlan->update($attributes);
            $this->updateOrCreatePlanInfo($attributes);
            DB::commit();
        } catch (\Exception $exception) {
            DB::rollBack();
            if ($this->debug) {
                dd($exception);
            }
            Log::error('更新采购计划失败: ' . $exception->getMessage() . '');
        }
    }

    private function createProcurementPlan(array $attributes)
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
    private function updateOrCreatePlanInfo(array $attributes)
    {
        /*
         * create planProductVariant
         * attributes['variants']
         * */

        $planInfo = array_get($attributes, 'variants');
        if ( !$planInfo) {
            throw new \Exception('采购计划必须存在商品');
        }

        // 1.有id    更新
        $changes = $this->attributesMapWithKeys($planInfo);
        $this->procurementPlan->planInfo->each(function ($variant) use ($changes) {
            /** @var ProcurementPlanProductVariant $variant */
            $attribute = $changes->get($variant->id);
            /*
             * update or delete
             * */
            is_null($attribute) ? $variant->delete() : $variant->update($attribute);

        });
        $willCreate = $this->findAddAttributes($planInfo);
        $willCreate->count() > 0 && $this->procurementPlan->planInfo()->createMany($willCreate->toArray());
    }


    /**
     * 审核采购计划
     * @param ProcurementPlan $model
     * @param array $attribute
     */
    public function approval(ProcurementPlan $model, array $attribute)
    {
        try {
            $history = $model->history ?? [];
            array_push($history,
                [
                    'info' => $attribute['info'] ?? $attribute['status'],
                    'user_id' => \Auth::id(),
                    'created_at' => date('Y-m-d H:i:s'),
                ]);
            $model->history = $history;
            $model->status = $attribute['status'];
            $model->save();
            $model->user->notify(new ApprovalProcurementPlan($model));
        } catch (\Exception $exception) {
            if ($this->debug) {
                dd($exception);
            }
        }
    }

    public function getPlanInfo($attribute = null)
    {
        return $this->procurementPlan->planInfo()->get($attribute);
    }

    public function calcTotalPriceOrPcs()
    {
        $variants = $this->getPlanInfo(['offer_price', 'pcs', 'price']);
        return $variants->reduce(function ($calc, $variant) {
            $calc['total_price'] += $variant['price'] * $variant['pcs'];
            $calc['total_pcs'] += $variant['pcs'];
            $calc['able_price'] += $variant['offer_price'] * $variant['pcs'];
            return $calc;
        }, ['total_price' => 0, 'total_pcs' => 0, 'able_price' => 0]);
    }
}