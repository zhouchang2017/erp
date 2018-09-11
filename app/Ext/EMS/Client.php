<?php
/**
 * Created by PhpStorm.
 * User: z
 * Date: 2018/9/11
 * Time: 上午9:59
 */

namespace App\Ext\EMS;

use GuzzleHttp\Client as HttpClient;
use GuzzleHttp\Exception\GuzzleException;
use GuzzleHttp\Psr7\Request;
use Spatie\ArrayToXml\ArrayToXml;

abstract class Client extends HttpClient
{
    protected $header = [];

    protected $body = null;

    public $version = 'international_eub_us_1.1';

    public function __construct(array $config = [])
    {
        parent::__construct($config);
        $this->header = [
            'version' => $this->version,
            'authenticate' => 'pdfTest_dhfjh98983948jdf78475fj65375fjdhfj',
        ];
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

    public function fetch()
    {
        try {
            $response = $this->send($this->buildRequest());
            echo $response->getStatusCode(); // 200
            echo $response->getReasonPhrase(); // OK
            echo $response->getProtocolVersion(); // 1.1
            $body = $response->getBody();
            echo $body;
            dd($body);
        } catch (GuzzleException $exception) {
            echo $exception->getMessage() . "\n";
            echo $exception->getRequest()->getMethod();
            dd($exception);
        }
    }

    public function setBodyToXML(array $xml, string $rootName = 'root')
    {
        $this->body = ArrayToXml::convert($xml, $rootName);
    }

    public function parseXml($xml)
    {

    }

}