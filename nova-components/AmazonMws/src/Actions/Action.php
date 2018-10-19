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

abstract class Action implements Arrayable
{
    use XmlParserTrait, ReportParserTrait;

    protected $params;

    protected $action;

    protected $apiType;

    protected $mock;

    protected $customResponse;

    protected $isAsync = false;

    protected $_response;

    protected $isNext = false;

    /**
     * @return bool
     */
    public function isNext(): bool
    {
        return $this->isNext;
    }

    /**
     * @return bool
     */
    public function getIsAsync(): bool
    {
        return $this->isAsync;
    }


    public function setIsAsync(bool $isAsync)
    {
        $this->isAsync = $isAsync;
        return $this;
    }

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

    public function next(string $nextToken, string $action = null)
    {
        $this->isNext = true;
        $this->params = [
            'NextToken' => $nextToken,
        ];
        $this->action = $action ?? $this->action . 'ByNextToken';
        return $this;
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

    public function response($data = null): Collection
    {
        $response = $this->mock ? $this->getMockData() : $data;
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

    public function isAssocArray(array $var)
    {
        return array_diff_assoc(array_keys($var), range(0, sizeof($var))) ? true : false;
    }

}