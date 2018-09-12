<?php
/**
 * Created by PhpStorm.
 * User: z
 * Date: 2018/9/11
 * Time: 下午5:02
 */

namespace Chang\AmazonMws\Actions;

use Illuminate\Contracts\Support\Arrayable;
use Psr\Http\Message\StreamInterface;
use Rodenastyle\StreamParser\StreamParser;
use Tightenco\Collect\Support\Collection;

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

    public function response(StreamInterface $data)
    {
        $reader = new \XMLReader();
        dd($reader->XML($data));
        return $this->xmlToArray($data);
    }

    protected function xmlToArray($xml)
    {
        //禁止引用外部xml实体
        libxml_disable_entity_loader(true);
        $values = json_decode(json_encode(simplexml_load_string($xml, 'SimpleXMLElement', LIBXML_NOCDATA)), true);
        return $values;
    }

    protected function textToArray(string $content)
    {
        $arr = explode("\r\n", $content);

        $header = explode("\t", array_shift($arr));
        $length = count($header);

        return collect($arr)->reduce(function ($res, $item) use ($header, $length) {
            tap(explode("\t", $item), function ($col) use ($header, $length, &$res) {
                if (count($col) === $length) {
                    array_push($res, array_combine($header, $col));
                }
            });
            return $res;
        }, []);
    }

}