<?php

namespace App\Modules\Warehouse\Observers;


use App\Modules\Warehouse\Models\Manually;

class ManuallyObserver
{
    public function updated(Manually $manually)
    {
        // 未入库，开始入库！
        if ( !$manually->finished() && $manually->statusIsFinished()) {
            $manually->put();
        }
    }
}