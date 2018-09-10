<?php

namespace App\Modules\Warehouse\Observers;


use App\Modules\Warehouse\Models\ManuallyProductVariant;

class ManuallyProductVariantObserver
{
    public function creating(ManuallyProductVariant $productVariant)
    {
        $productVariant->setAttribute('good', $productVariant->pcs);
    }
}