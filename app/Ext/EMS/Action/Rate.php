<?php
/**
 * Created by PhpStorm.
 * User: z
 * Date: 2018/9/11
 * Time: 上午11:56
 */

namespace App\Ext\EMS\Action;


use App\Ext\EMS\Client;

class Rate extends Client
{
    protected $params;

    public function __construct(array $config = [])
    {
        parent::__construct($config);
        $this->setHeader(['Content-Type' => 'text/xml; charset=UTF8']);
    }

    public function __invoke(array $params)
    {
        $this->params = $params;
        $this->setBodyToXML($params,'rate');
        $this->fetch();
    }

    public function getQueryParams()
    {
        // TODO: Implement getQueryParams() method.
    }

    public function getRequestMethod(): string
    {
        return 'POST';
    }

    public function getRequestUri(): string
    {
        return 'http://www.ems.com.cn/partner/api/public/p/rate/epacket/';
    }
}