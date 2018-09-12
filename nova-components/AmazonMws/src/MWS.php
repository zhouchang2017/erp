<?php
/**
 * Created by PhpStorm.
 * User: z
 * Date: 2018/9/10
 * Time: 下午6:33
 */

namespace Chang\AmazonMws;

use Chang\AmazonMws\Actions\Action;
use Chang\AmazonMws\Traits\SignTrait;
use Exception;
use Chang\AmazonMws\Traits\UserAgentHeaderTrait;

/**
 * Class Mws
 * @package Mws
 */
class MWS extends Client
{
    use UserAgentHeaderTrait, SignTrait;

    protected $config;

    protected $method = 'POST';

    protected $uri;

    protected $endPoint;

    /**
     * 客户端版本
     */
    const CLIENT_VERSION = 'v0.0.1';

    protected $userAgentHeader;

    public function __construct(array $amazon, array $keys = [], array $config = [])
    {
        parent::__construct($config);
        try {
            $this->setConfig($amazon, $keys);
            $this->userAgentHeader = $this->getUserAgentHeader($this->config['name'], self::CLIENT_VERSION);
            $this->setHeader([
                'UserAgent' => $this->userAgentHeader,
                'Content-Type' => "application/x-www-form-urlencoded; charset=utf-8",
                'Expect' => null,
            ]);
            $this->setEndPoint($this->getEndPoint($this->config['country'][0]['code']));
        } catch (Exception $e) {
            dd($e);
        }
    }

    public function action(Action $action)
    {
        $config = $action->toArray();
        $this->setUri($this->endPoint . '/' . $config['apiType'] . '/' . $config['version']);

        $params = array_merge($config['params'], ['action' => $config['action']]);

        $this->setFormParams($params);

        return $action->response($this->fetch());
    }

    /**
     * 启动MWS服务，设置店铺信息
     * @param array $config
     * @param array $keys
     * @return $this
     * @throws Exception
     */
    public function setConfig(array $config, array $keys)
    {
        if ($config) {
            if (count($keys) > 0) {
                $config = array_merge($config, $keys);
            }
            if ( !key_exists('seller_id', $config)) {
                throw new Exception('seller_id不存在');
            }
            if ( !key_exists('mws_auth_token', $config)) {
                throw new Exception('mws_auth_token不存在');
            }
//            if ( !key_exists('service_locale', $config)) {
//                throw new Exception('service_locale不存在');
//            }
            if ( !key_exists('name', $config)) {
                $config['name'] = config('amazon.app_name');
            }
            if ( !key_exists('user_agent', $config)) {
                $config['user_agent'] = config('amazon.user_agent');
            }
            $this->config = $config;
            return $this;
        }
        throw new Exception('缺少必要参数');
    }

    /**
     * @param string $method
     */
    public function setMethod(string $method): void
    {
        $this->method = $method;
    }

    /**
     * @param mixed $uri
     */
    public function setUri($uri): void
    {
        $this->uri = $uri;
    }

    public function setFormParams($params = [])
    {
        $this->setOptions([
            'form_params' => $this->signer($params, $this->getRequestUri()),
        ]);
    }

    public function getQueryParams()
    {
        // TODO: Implement getQueryParams() method.
    }

    public function getRequestMethod(): string
    {
        return $this->method;
    }

    public function getRequestUri(): string
    {
        return $this->uri;
    }

    public function getEndPoint($country)
    {
        $list = config('amazon.services_url');
        if (array_key_exists($country, $list)) {
            return $list[$country];
        }
        return $list[config('amazon.default_service_locale')];
    }

    public function getMarketplaceId($country)
    {
        $list = config('amazon.marketplaceId');
        if (array_key_exists($country, $list)) {
            return $list[$country];
        }
        return $list[config('amazon.default_service_locale')];
    }

    /**
     * @param mixed $endPoint
     */
    public function setEndPoint($endPoint): void
    {
        $this->endPoint = $endPoint;
    }


}