<?php
/**
 * Created by PhpStorm.
 * User: z
 * Date: 2018/9/11
 * Time: 下午5:02
 */

namespace Chang\AmazonMws\Actions;

use Illuminate\Contracts\Support\Arrayable;

abstract class Action implements Arrayable
{
    protected $params;

    protected $action;

    protected $apiType;

    public function __construct($params = null)
    {
        $this->params = $params ?? [];
        $this->action = $this->setAction();
        $this->apiType = $this->setApiType();
    }

    public static function make(...$arguments)
    {
        return new static(...$arguments);
    }

    abstract public function setApiType(): string;

    abstract public function setAction(): string;

    abstract public function getVersion(): string;

    public function toArray()
    {
        return [
            'version' => $this->getVersion(),
            'apiType' => $this->apiType,
            'action' => $this->action,
            'params' => $this->params,
        ];
    }

}