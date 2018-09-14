<?php
/**
 * Created by PhpStorm.
 * User: z
 * Date: 2018/9/12
 * Time: 3:30 PM
 */

namespace Chang\AmazonMws\Actions\Reports;


use Chang\AmazonMws\Actions\Action;
use Chang\AmazonMws\Traits\ActionTrait;
use Illuminate\Support\Collection;
use Psr\Http\Message\StreamInterface;

class GetReport extends Action
{
    use ActionTrait;

    public function response(StreamInterface $data = null): Collection
    {
        return $this->textToArray($data->getContents());
    }

}