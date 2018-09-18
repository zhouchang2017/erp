<?php
/**
 * Created by PhpStorm.
 * User: z
 * Date: 2018/9/14
 * Time: 5:37 PM
 */

namespace Chang\AmazonMws\Actions\Products;


use Chang\AmazonMws\Actions\Action;
use Chang\AmazonMws\Traits\ActionTrait;

class GetMatchingProductForId extends Action
{
    use ActionTrait;

    public static function toFormData(array $data)
    {

    }
}