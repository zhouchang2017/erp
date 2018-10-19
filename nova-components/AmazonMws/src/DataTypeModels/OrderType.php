<?php
/**
 * Created by PhpStorm.
 * User: z
 * Date: 2018/9/27
 * Time: 2:09 PM
 */

namespace Chang\AmazonMws\DataTypeModels;


/**
 * @property mixed amazon_order_id
 * @property mixed shipping_address
 * @property mixed order_item_id
 */
class OrderType extends DataTypeModel
{
    public const CREATED_AT = 'purchase_date';

    public const UPDATED_AT = 'last_update_date';

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


    ];

    protected $appendAttributeKeys = ['shipping_address'];


    public function setLatestShipDateAttribute($value)
    {
        $this->setTime('latest_ship_date', $value);
    }

    public function setEarliestShipDateAttribute($value)
    {
        $this->setTime('earliest_ship_date', $value);
    }

    public function setTime($key, $value)
    {
        if ($value && $this->isDateAttribute($key) && $value !== '1970-01-01T00:00:00Z') {
            $value = $this->fromDateTime($value);
        } else {
            $value = null;
        }
        $this->attributes[$key] = $value;
    }

}