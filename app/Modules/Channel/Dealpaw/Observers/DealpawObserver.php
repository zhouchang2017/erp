<?php
/**
 * Created by PhpStorm.
 * User: z
 * Date: 2018/10/10
 * Time: 10:08 AM
 */

namespace App\Modules\Channel\Dealpaw\Observers;


use App\Modules\Channel\Dealpaw\Models\Dealpaw;

class DealpawObserver
{
    public function created(Dealpaw $dealpaw)
    {
        $dealpaw->inChannel();
    }
}