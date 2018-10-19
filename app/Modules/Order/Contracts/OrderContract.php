<?php
/**
 * Created by PhpStorm.
 * User: z
 * Date: 2018/10/8
 * Time: 11:48 AM
 */

namespace App\Modules\Order\Contracts;

use App\Modules\Scaffold\BaseModel as Model;

abstract class OrderContract extends Model
{
    abstract public function toStatus(): string;

    public function toMorphArray(): array
    {
        return [
            'order_status' => $this->toStatus(),
            'channel_id' => $this->channel_id,
            'created_at' => $this->getCreatedAt(),
            'updated_at' => $this->getUpdatedAt(),
        ];
    }

    abstract public function getCreatedAt();

    abstract public function getUpdatedAt();

    abstract public function getChannelIdAttribute();

    /**
     * @return \Illuminate\Database\Eloquent\Relations\HasMany
     */
    abstract public function items();

    /**
     * @return \Illuminate\Database\Eloquent\Relations\MorphMany
     */
    abstract public function morphOrder();

    abstract static public function rules(): array;

    abstract static public function messages(): array;
}