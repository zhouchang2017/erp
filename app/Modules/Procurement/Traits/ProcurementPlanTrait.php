<?php
/**
 * Created by PhpStorm.
 * User: z
 * Date: 2018/9/4
 * Time: 上午11:17
 */

namespace App\Modules\Procurement\Traits;


use App\Modules\Procurement\Enums\ProcurementStatus;

trait ProcurementPlanTrait
{
    /**
     * 创建采购单
     */
    public function createProcurement()
    {
        $this->procurement()->create(
            $this->calcTotalPriceOrPcs()
        );
    }

    /*
     * 获取采购计划详情（产品变体）
     * */
    public function getPlanInfo($attribute = null)
    {
        return $this->planInfo()->get($attribute);
    }

    /*
     * 计算价格和数量
     * */
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

    public function calcShipmentStatus()
    {
        $status = ProcurementStatus::getDescription(2);;
        $arrived = $this->planInfo()->get(['pcs', 'arrived_pcs'])->every(function ($item) use ($status) {
            $res = $item->pcs - $item->arrived_pcs;
            if ($res > 0 && $res < $item->pcs) {
                $status = ProcurementStatus::getDescription(0);
            }
            return $res === 0;
        });

        return tap($status, function (&$item) use ($arrived) {
            $item = $arrived ? ProcurementStatus::getDescription(3) : $item;
        });
    }
}