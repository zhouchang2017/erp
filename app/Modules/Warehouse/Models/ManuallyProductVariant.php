<?php

namespace App\Modules\Warehouse\Models;

use App\Modules\ProductProvider\Models\ProductProvider;
use Illuminate\Database\Eloquent\Relations\Pivot;

/**
 * Class ManuallyProductVariant
 * @package App\Models
 */
class ManuallyProductVariant extends Pivot
{

    /**
     * @var string
     */
    protected $table = 'manually_product_variant';

    /**
     * 产品供应商
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function provider()
    {
        return $this->belongsTo(ProductProvider::class, 'product_provider_id');
    }

    /**
     * 手工入库
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function manually()
    {
        return $this->belongsTo(Manually::class, 'manually_id');
    }

    /**
     * @return \Illuminate\Database\Eloquent\Relations\MorphMany
     */
    public function history()
    {
        return $this->morphMany(StorageHistory::class,'origin');
    }

    /**
     * @return int
     */
    public function getTotalPrice(): int
    {
        return (int)$this->price * (int)$this->pcs;
    }

}
