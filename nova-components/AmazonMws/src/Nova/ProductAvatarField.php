<?php
/**
 * Created by PhpStorm.
 * User: z
 * Date: 2018/9/26
 * Time: 2:20 PM
 */

namespace Chang\AmazonMws\Nova;


class ProductAvatarField
{

    public static function getOriginAvatar($url)
    {
        return preg_replace("/\._SL[0-9]+_/", "", $url);
    }
}