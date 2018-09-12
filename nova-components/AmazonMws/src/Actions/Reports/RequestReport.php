<?php
/**
 * Created by PhpStorm.
 * User: z
 * Date: 2018/9/12
 * Time: 2:51 PM
 */

namespace Chang\AmazonMws\Actions\Reports;

use Chang\AmazonMws\Actions\Action;
use Chang\AmazonMws\Traits\ActionTrait;

class RequestReport extends Action
{
    use ActionTrait;

    public function getVersion(): string
    {
        return '2009-01-01';
    }

}