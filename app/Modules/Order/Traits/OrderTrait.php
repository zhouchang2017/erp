<?php
/**
 * Created by PhpStorm.
 * User: z
 * Date: 2018/10/8
 * Time: 11:41 AM
 */

namespace App\Modules\Order\Traits;


use App\Modules\Order\Models\Order;

trait OrderTrait
{
    /**
     * @return \Illuminate\Database\Eloquent\Relations\MorphMany
     */
    public function morphOrder()
    {
//        return $this->morphMany(Order::class, 'orderable');
        return $this->morphOne(Order::class, 'orderable');
    }
}