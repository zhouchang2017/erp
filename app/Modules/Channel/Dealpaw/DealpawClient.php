<?php
/**
 * Created by PhpStorm.
 * User: z
 * Date: 2018/10/9
 * Time: 11:43 AM
 */

namespace App\Modules\Channel\Dealpaw;

use App\Modules\Channel\Dealpaw\Models\Dealpaw;
use GuzzleHttp\Client as HttpClient;
use GuzzleHttp\Exception\GuzzleException;
use GuzzleHttp\Exception\RequestException;
use GuzzleHttp\Psr7\Request;
use Psr\Http\Message\ResponseInterface;
use GuzzleHttp\Psr7;

class DealpawClient extends HttpClient
{
    protected $method = 'GET';

    protected $uri;

    protected $header = [];

    protected $params = [];

    protected $body = null;

    protected $options = [];

    protected $dealpaw;

    public function __construct(Dealpaw $dealpaw, array $config = [])
    {
        $this->dealpaw = $dealpaw;
        $config = array_merge($config, [
            'base_uri' => $dealpaw->api_prefix ? $dealpaw->api_url . $dealpaw->api_prefix . '/' : $dealpaw->api_url,
        ]);
        parent::__construct($config);
        $this->loadConfig();
    }

    private function loadConfig()
    {
        $header = collect($this->dealpaw->header)->mapWithKeys(function ($item) {
            return [$item['key'] => $item['value']];
        })->toArray();

        $this->setHeader($header);
    }

    private function buildRequest()
    {
        return new Request($this->method, $this->getUri(), $this->header, $this->body);
    }

    public function fetch()
    {
        try {
            \Log::info('http request: ', $this->getRequestOptions());
            $response = $this->send($this->buildRequest(), $this->getRequestOptions());
            return $this->responseEncodingUtf8($response);
        } catch (GuzzleException $exception) {
            dd(Psr7\str($exception->getResponse()));
//            dd($exception->getMessage());
        }
    }

    /**
     * @return string
     */
    public function getMethod(): string
    {
        return $this->method;
    }

    /**
     * @param string $method
     */
    public function setMethod(string $method): void
    {
        $this->method = $method;
    }

    /**
     * @return mixed
     */
    public function getUri()
    {
        if ($this->method === 'GET') {
            $this->uri = count($this->params) > 0 ? $this->uri . '?' . http_build_query($this->params) : $this->uri;
        }
        return $this->uri;
    }

    /**
     * @param mixed $uri
     */
    public function setUri($uri): void
    {
        $this->uri = $uri;
    }

    /**
     * @return mixed
     */
    public function getHeader()
    {
        return $this->header;
    }

    /**
     * @param mixed $header
     */
    public function setHeader($header): void
    {
        $this->header = array_merge($this->header, $header);
    }

    /**
     * @return mixed
     */
    public function getParams()
    {
        return $this->params;
    }

    /**
     * @param mixed $params
     */
    public function setParams($params): void
    {
        $this->params = $params;
    }

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

    private function getRequestOptions()
    {
        if ($this->method === 'GET') {
            return $this->options;
        }

        if ($this->method === 'PUT') {
            return array_merge($this->options, [
                'json' => $this->params,
            ]);
        }
        return array_merge($this->options, [
            'form_params' => $this->params,
        ]);
    }

    /**
     * @return null
     */
    public function getBody()
    {
        return $this->body;
    }

    /**
     * @param null $body
     */
    public function setBody($body): void
    {
        $this->body = $body;
    }

    private function responseEncodingUtf8(ResponseInterface $response)
    {
        $type = $response->getHeader('content-type');
        $parsed = Psr7\parse_header($type);
        $format = mb_convert_encoding($response->getBody(), 'UTF-8', $parsed[0]['charset'] ?? 'UTF-8');
        return json_decode($format, true);
    }


}