<?php

namespace App\Modules\Warehouse\Services;


use App\Modules\Scaffold\Traits\HelperTrait;
use App\Modules\Warehouse\Models\Manually;
use App\Notifications\ApprovalManually;
use DB;
use Log;

class ManuallyService
{
    use HelperTrait;

    protected $manually;


    protected $debug;


    public function __construct(Manually $manually)
    {
        $this->manually = $manually;
        $this->debug = config('app.debug');
    }

    /**
     * @param Manually $manually
     * @return ManuallyService
     */
    public function setManually(Manually $manually): ManuallyService
    {
        $this->manually = $manually;
        return $this;
    }

    public function create(array $attributes)
    {
        try {
            DB::beginTransaction();
            $this->createManually($attributes);
            $this->updateOrCreateManuallyInfo($attributes);
            DB::commit();
        } catch (\Exception $exception) {
            DB::rollBack();
            if ($this->debug) {
                dd($exception);
            }
            Log::error('手动入库创建失败: ' . $exception->getMessage() . '');
        }
    }

    /**
     * @param $id
     * @param array $attributes
     */
    public function update($id, array $attributes)
    {
        try {
            DB::beginTransaction();
            $this->setManually($this->manually::findOrFail($id));
            $this->manually->update($attributes);
            $this->updateOrCreateManuallyInfo($attributes);
            DB::commit();
        } catch (\Exception $exception) {
            DB::rollBack();
            if ($this->debug) {
                dd($exception);
            }
            Log::error('更新手动入库失败: ' . $exception->getMessage() . '');
        }
    }

    protected function createManually(array $attributes)
    {
        $this->setManually($this->manually::create($attributes));
    }

    /**
     * @param array $attributes
     * @throws \Exception
     */
    protected function updateOrCreateManuallyInfo(array $attributes)
    {
        $manuallyInfo = array_get($attributes, 'variants');
        if ( !$manuallyInfo) {
            throw new \Exception('采购计划必须存在商品');
        }

        // 1.有id    更新
        $changes = $this->attributesMapWithKeys($manuallyInfo);

        $this->manually->manuallyInfo->each(function ($variant) use ($changes) {
            $attribute = $changes->get($variant->id);
            /*
             * update or delete
             * */
            is_null($attribute) ? $variant->delete() : $variant->update($attribute);

        });
        $willCreate = $this->findAddAttributes($manuallyInfo);
        $willCreate->count() > 0 && $this->manually->manuallyInfo()->createMany($willCreate->toArray());
    }

    /**
     * 审核手工入库
     * @param Manually $model
     * @param array $attribute
     */
    public function approval(Manually $model, array $attribute)
    {
        try {
            $history = $model->getAttribute('history') ?? [];
            array_push($history,
                [
                    'info' => $attribute['info'] ?? $attribute['status'],
                    'user_id' => \Auth::id(),
                    'created_at' => date('Y-m-d H:i:s'),
                ]);
            $model->history = $history;
            $model->status = $attribute['status'];
            $model->save();
            $model->user->notify(new ApprovalManually($model));
        } catch (\Exception $exception) {
            if ($this->debug) {
                dd($exception);
            }
        }
    }
}