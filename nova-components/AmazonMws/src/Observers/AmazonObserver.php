<?php
/**
 * Created by PhpStorm.
 * User: z
 * Date: 2018/10/8
 * Time: 4:46 PM
 */

namespace Chang\AmazonMws\Observers;

use Chang\AmazonMws\Models\Amazon;

class AmazonObserver
{
    public function created(Amazon $amazon)
    {
        $amazon->inChannel();
    }
}