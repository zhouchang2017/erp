<?php
/**
 * Created by PhpStorm.
 * User: z
 * Date: 2018/9/11
 * Time: 上午10:18
 */

namespace App\Ext\EMS\Action;


use App\Ext\EMS\Client;

class Track extends Client
{
    const END_POINT = 'http://www.ems.com.cn/partner/api/public/p/order/{number}';

    protected $number;

    protected static function formatEndpoint($number)
    {
        return str_replace('{number}', $number, static::END_POINT);
    }

    public function __invoke($number)
    {
        $this->number = $number;
        $this->fetch();
    }

    public function getQueryParams()
    {
        return [];
    }

    public function getRequestMethod(): string
    {
        return 'GET';
    }

    public function getRequestUri(): string
    {
        return static::formatEndpoint($this->number);
    }
}