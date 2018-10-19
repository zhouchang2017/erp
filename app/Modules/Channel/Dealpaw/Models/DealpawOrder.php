<?php

namespace App\Modules\Channel\Dealpaw\Models;

use App\Modules\Channel\Dealpaw\Observers\DealpawOrderObserver;
use App\Modules\Order\Contracts\OrderContract;
use App\Modules\Order\Enums\OrderStatus;
use App\Modules\Order\Traits\OrderTrait;
use App\Modules\Scaffold\Traits\MoneyFormatAble;

/**
 * Class DealpawOrder
 * @package App\Modules\Order\Models
 */
class DealpawOrder extends OrderContract
{
    use OrderTrait, MoneyFormatAble;

    /**
     * @var array
     */
    protected $fillable = [
        'number',
        'address_id',
        'channel_id',
        'user_id',
        'total',
        'currency_code',
        'state',
        'payment_state',
        'shipping_state',
        'user_ip',
        'payment_method_name',
        'coupon_name',
        'paid_at',
        'confirmed_at',
        'reviewed_at',
        'fulfilled_at',
    ];

    public static $updateFillable = [
        'user_id',
        'total',
        'currency_code',
        'state',
        'payment_state',
        'shipping_state',
        'user_ip',
        'payment_method_name',
        'coupon_name',
        'paid_at',
        'confirmed_at',
        'reviewed_at',
        'fulfilled_at',
    ];

    /**
     * @var array
     */
    protected $casts = [
        'paid_at' => 'datetime',
        'confirmed_at' => 'datetime',
        'reviewed_at' => 'datetime',
        'fulfilled_at' => 'datetime',
    ];

    protected static function boot()
    {
        parent::boot();
        self::observe(DealpawOrderObserver::class);
    }


    /**
     * @return \Illuminate\Database\Eloquent\Relations\HasMany
     */
    public function items()
    {
        return $this->hasMany(DealpawOrderItem::class, 'order_id');
    }

    public function address()
    {
        return $this->belongsTo(DealpawShippingAddress::class, 'address_id', 'dealpaw_address_id');
    }

    public function dealpaw()
    {
        return $this->belongsTo(Dealpaw::class, 'dealpaw_id');
    }

    public function shipments()
    {
        return $this->hasMany(ShipmentDealpawOrderItem::class, 'order_id');
    }

    public function getTotalAttribute($value)
    {
        return $this->displayCurrencyByTextUsing($value);
    }

    /**
     * @return array
     */
    static public function rules(): array
    {
        return [
            'items' => 'required|array',
        ];
    }

    /**
     * @return array
     */
    static public function messages(): array
    {
        return [];
    }

    /**
     * @return string
     */
    public function toStatus(): string
    {
        // 订单取消
        if ($this->state === 'cancelled') {
            return OrderStatus::getDescription(OrderStatus::CANCEL);
        }
        // 订单已发货
        if ($this->shipping_state === 'shipped') {
            return OrderStatus::getDescription(OrderStatus::SHIPPED);
        }
        // 订单以付款
        if ($this->payment_state === 'paid') {
            return OrderStatus::getDescription(OrderStatus::UNSHIPPED);
        }
        // 等待买家付款
        if ($this->state === 'new') {
            return OrderStatus::getDescription(OrderStatus::PENDING);
        }

        return OrderStatus::getDescription(OrderStatus::PENDING);
    }

    public function getCreatedAt()
    {
        return $this->created_at;
    }

    public function getUpdatedAt()
    {
        return $this->updated_at;
    }

    public function getChannelIdAttribute()
    {
        return $this->dealpaw->channel->id;
    }
}
