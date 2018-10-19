<?php
/**
 * Created by PhpStorm.
 * User: z
 * Date: 2018/9/25
 * Time: 4:38 PM
 */

namespace Chang\AmazonMws\DataTypeModels;


use Illuminate\Database\Eloquent\Concerns\HasAttributes;

class ProductType
{
    use HasAttributes;
    protected $sku;
    protected $marketplaceId;
    protected $asin;
    protected $avatar;

    /**
     * The model's attributes.
     *
     * @var array
     */
    protected $attributes = [];
}