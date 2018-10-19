<?php
/**
 * Created by PhpStorm.
 * User: z
 * Date: 2018/9/26
 * Time: 10:31 AM
 */

namespace Chang\AmazonMws\DataTypeModels;


/**
 * Class ListInventorySupplyType
 * @package Chang\AmazonMws\DataTypeModels
 */
class ListInventorySupplyType extends DataTypeModel
{
    protected $fillable = [
        'seller_sku',
        'asin',
        'fnsku',
        'in_stock_supply_quantity',
        'condition',
        'total_supply_quantity',
        'earliest_availability',
        'supply_detail',
    ];

    protected $casts = [
        'earliest_availability' => 'array',
        'supply_detail' => 'array',
    ];

    protected $ignoreConversionAttributes = [
        'FNSKU' => 'fnsku',
        'SellerSKU' => 'seller_sku',
        'ASIN' => 'asin',
    ];

}