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
use Chang\AmazonMws\Traits\ProductsApiTrait;
use Illuminate\Support\Collection;

class GetMatchingProductForId extends Action
{
    use ActionTrait, ProductsApiTrait;

    public function response($data = null): Collection
    {
        $response = parent::response($data);
        return $this->getMatchingProductForIdResultToCollection(
            $response->get('GetMatchingProductForIdResponse')
                ->get('GetMatchingProductForIdResult')
        );
    }


}