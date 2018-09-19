<?php
/**
 * Created by PhpStorm.
 * User: z
 * Date: 2018/9/11
 * Time: 下午2:24
 */

namespace Chang\AmazonMws;

use GuzzleHttp\Client as HttpClient;
use GuzzleHttp\Exception\GuzzleException;
use GuzzleHttp\Psr7\Request;
use Psr\Http\Message\ResponseInterface;
use Spatie\ArrayToXml\ArrayToXml;
use GuzzleHttp\Psr7;


abstract class Client extends HttpClient
{
    protected $header = [];

    protected $body = null;

    protected $options = [];

    /**
     * @return array
     */
    public function getOptions(): array
    {
        return $this->options;
    }

    /**
     * @param array $options
     */
    public function setOptions(array $options): void
    {
        $this->options = $options;
    }

    public function __construct(array $config = [])
    {
        parent::__construct($config);

    }

    /**
     * @return mixed
     */
    public function getHeader()
    {
        return $this->header;
    }

    /**
     * @param array $header
     */
    public function setHeader(array $header): void
    {
        $this->header = array_merge($this->header, $header);
    }

    abstract public function getQueryParams();

    abstract public function getRequestMethod(): string;

    abstract public function getRequestUri(): string;

    public function buildRequest()
    {
        return new Request($this->getRequestMethod(), $this->getRequestUri(), $this->getHeader(), $this->body);
    }

    /**
     * @return \Psr\Http\Message\StreamInterface
     */
    public function fetch()
    {
        try {
            \Log::info('http request: ', $this->getOptions());
            $response = $this->send($this->buildRequest(), $this->getOptions());
            return $this->responseEncodingUtf8($response);
        } catch (GuzzleException $exception) {
            dd(Psr7\str($exception->getResponse()));
//            dd($exception->getMessage());
        }
    }

    public function setBodyToXML(array $xml, string $rootName = 'root')
    {
        $this->body = ArrayToXml::convert($xml, $rootName);
    }


    private function responseEncodingUtf8(ResponseInterface $response)
    {
        $type = $response->getHeader('content-type');
        $parsed = Psr7\parse_header($type);
        return mb_convert_encoding($response->getBody(), 'UTF-8', $parsed[0]['charset'] ?? 'UTF-8');
    }

}