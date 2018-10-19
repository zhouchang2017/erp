<?php

namespace Chang\AmazonMws\Models;

use App\Modules\Order\Contracts\OrderContract;
use App\Modules\Order\Enums\OrderStatus;
use App\Modules\Order\Traits\OrderTrait;
use Carbon\Carbon;
use Chang\AmazonMws\Observers\OrderObserver;


/**
 * @property mixed amazon_order_id
 * @property mixed id
 * @property mixed order_item_id
 * @property mixed order_status
 */
class Order extends OrderContract
{
    use OrderTrait;

    protected $table = 'amazon_orders';

    protected $fillable = [
        'amazon_order_id',
        'seller_order_id',
        'purchase_date',
        'last_update_date',
        'order_status',
        'fulfillment_channel',
        'sales_channel',
        'order_channel',
        'ship_service_level',
        'shipping_address',

        'order_total',
        'number_of_items_shipped',
        'number_of_items_unshipped',
        'payment_execution_detail',
        'payment_method',
        'marketplace_id',
        'buyer_email',
        'buyer_name',
        'shipment_service_level_category',
        'shipped_by_amazon_tFM',
        'tFMShipment_status',
        'cba_displayable_shipping_label',
        'order_type',
        'earliest_ship_date',
        'latest_ship_date',
        'earliest_delivery_date',
        'latest_delivery_date',
    ];

    protected $casts = [
        'order_total' => 'array',
        'payment_execution_detail' => 'array',

        'earliest_ship_date' => 'datetime',
        'latest_ship_date' => 'datetime',
        'earliest_delivery_date' => 'datetime',
        'latest_delivery_date' => 'datetime',

        'purchase_date' => 'datetime',
        'last_update_date' => 'datetime',
    ];

    protected $morphStatus = [
        'PendingAvailability' => 'pending',
        'Pending' => 'pending',
        'Unshipped' => 'unshipped',
        'PartiallyShipped' => 'partially_shipped',
        'Shipped' => 'shipped',
        'InvoiceUnconfirmed' => 'shipped',
        'Canceled' => 'canceled',
        'Unfulfillable' => 'unfulfillable',
    ];

    protected static function boot()
    {
        parent::boot();
        self::observe(OrderObserver::class);
    }

    public function shippingAddress()
    {
        return $this->hasOne(ShippingAddress::class, 'order_id');
    }

    public function items()
    {
        return $this->hasMany(OrderItem::class, 'order_id');
    }

    public function toStatus(): string
    {
        return array_get($this->morphStatus, $this->order_status);
    }


    static public function rules(): array
    {
        return [];
    }

    static public function messages(): array
    {
        return [];
    }

    public function getCreatedAt()
    {
        return $this->purchase_date->toDateTimeString();
    }

    public function getUpdatedAt()
    {
        return $this->last_update_date->toDateTimeString();
    }

    public function amazon()
    {
        return $this->belongsTo(Amazon::class, 'amazon_id');
    }

    public function getChannelIdAttribute()
    {
        return $this->amazon->channel->id;
    }
}
