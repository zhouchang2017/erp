<?php
/**
 * Created by PhpStorm.
 * User: z
 * Date: 2018/9/11
 * Time: 下午3:59
 */

namespace Chang\AmazonMws\Actions\Sellers;

use Chang\AmazonMws\Actions\Action;
use Chang\AmazonMws\Traits\ActionTrait;

class ListMarketplaceParticipations extends Action
{
    use ActionTrait;

    public function getVersion(): string
    {
        return '2011-07-01';
    }
}