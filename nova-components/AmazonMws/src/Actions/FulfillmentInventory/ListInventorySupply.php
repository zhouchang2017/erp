<?php
/**
 * Created by PhpStorm.
 * User: z
 * Date: 2018/9/12
 * Time: 5:55 PM
 */

namespace Chang\AmazonMws\Actions\FulfillmentInventory;


use Chang\AmazonMws\Actions\Action;
use Chang\AmazonMws\Traits\ActionTrait;
use Illuminate\Support\Collection;

class ListInventorySupply extends Action
{
    use ActionTrait;

    public function response($data = null): Collection
    {
        $response = parent::response($data);
        return $this->getListInventorySupplyResultToCollection($response);
    }

    public function getListInventorySupplyResultToCollection($data)
    {
        if ( !$data instanceof Collection) {
            $data = collect($data);
        }

        return $this->isNext() ? $data->get('ListInventorySupplyByNextTokenResponse')->get('ListInventorySupplyByNextTokenResult')
            : $data->get('ListInventorySupplyResponse')->get('ListInventorySupplyResult');
    }

}