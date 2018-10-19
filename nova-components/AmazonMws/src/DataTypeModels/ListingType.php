<?php
/**
 * Created by PhpStorm.
 * User: z
 * Date: 2018/9/25
 * Time: 3:19 PM
 */

namespace Chang\AmazonMws\DataTypeModels;

class ListingType extends DataTypeModel
{

    protected $fillable = [
        'sku',
        'asin',
        'price',
        'quantity',
        'business_price',
        'business_options',

        'market_place_id',
        'binding',
        'brand',
        'color',
        'part_number',
        'product_group',
        'product_type_name',
        'title',
        'avatar',

        'props',
        'variation_parent',
        'sales_rank',
    ];

    protected $casts = [
        'business_options' => 'array',
        'props' => 'array',
        'variation_parent' => 'array',
        'sales_rank' => 'array',
    ];

    public function __construct(array $attributes = [])
    {
        parent::__construct($attributes);
        array_key_exists('business_price', $attributes) && $this->fillBusinessOptions($attributes);
    }

    public function fillBusinessOptions($attributes)
    {
        $this->fill(
            [
                'business_options' => array_only($attributes, [
                    'quantity_price_type',
                    'quantity_lower_bound1',
                    'quantity_price1',
                    'quantity_lower_bound2',
                    'quantity_price2',
                    'quantity_lower_bound3',
                    'quantity_price3',
                    'quantity_lower_bound4',
                    'quantity_price4',
                    'quantity_lower_bound5',
                    'quantity_price5',
                ]),
            ]
        );
    }

    public function getQuantityAttribute($value)
    {
        return empty($value) ? 0 : $value;
    }
}