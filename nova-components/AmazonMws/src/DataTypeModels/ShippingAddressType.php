<?php
/**
 * Created by PhpStorm.
 * User: z
 * Date: 2018/9/27
 * Time: 5:24 PM
 */

namespace Chang\AmazonMws\DataTypeModels;


class ShippingAddressType extends DataTypeModel
{
    protected $fillable = [
        'name',
        'address_line_1',
        'address_line_2',
        'address_line_3',
        'city',
        'county',
        'district',
        'state_or_region',
        'postal_code',
        'country_code',
        'phone',
    ];

    protected $ignoreConversionAttributes = [
        'AddressLine1' => 'address_line_1',
        'AddressLine2' => 'address_line_2',
        'AddressLine3' => 'address_line_3',
    ];
}