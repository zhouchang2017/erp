<?php
/**
 * Created by PhpStorm.
 * User: z
 * Date: 2018/9/11
 * Time: 下午5:02
 */

namespace Chang\AmazonMws\Actions;

use Chang\AmazonMws\Traits\ReportParserTrait;
use Chang\AmazonMws\Traits\XmlParserTrait;
use Illuminate\Contracts\Support\Arrayable;
use Illuminate\Support\Collection;
use Psr\Http\Message\StreamInterface;

abstract class Action implements Arrayable
{
    use XmlParserTrait, ReportParserTrait;

    protected $params;

    protected $action;

    protected $apiType;

    protected $mock;

    protected $customResponse;

    public function __construct($params = null, $mock = false)
    {
        $this->params = $params ?? [];
        $this->action = $this->setAction();
        $this->apiType = $this->setApiType();
        $this->mock = $mock;
    }

    public function isMock()
    {
        return $this->mock;
    }

    public static function make(...$arguments)
    {
        return new static(...$arguments);
    }

    abstract public function setApiType(): string;

    abstract public function setAction(): string;

    public function getVersion()
    {
        return config('amazon.mws.version')[$this->apiType];
    }

    public function toArray()
    {
        return [
            'version' => $this->getVersion(),
            'apiType' => $this->apiType,
            'action' => $this->action,
            'params' => $this->params,
        ];
    }

    public function getMockData()
    {
        return '';
    }

    public function responseMock()
    {
        return $this->getMockData();
    }

    public function response(StreamInterface $data = null): Collection
    {
        $response = $this->mock ? $this->getMockData() : $data->getContents();
        return $this->xmlToArray($response);
    }

    public function setResponse(\Closure $callback)
    {
        $this->customResponse = $callback;
        return $this;
    }

    protected function callCustomResponse($data)
    {
        return call_user_func($this->customResponse, $data);
    }

}