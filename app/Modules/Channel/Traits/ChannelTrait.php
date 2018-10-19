<?php
/**
 * Created by PhpStorm.
 * User: z
 * Date: 2018/10/10
 * Time: 10:12 AM
 */

namespace App\Modules\Channel\Traits;


use App\Modules\Channel\Channel;

trait ChannelTrait
{
    public function channel()
    {
        return $this->morphOne(Channel::class, 'channelable');
    }
}