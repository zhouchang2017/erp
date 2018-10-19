<?php

namespace App\Modules\Channel;

use App\Modules\Order\Models\Order;
use Illuminate\Database\Eloquent\Model;

class Channel extends Model
{
    protected $fillable = [
        'name',
        'description',
        'enabled',
    ];

    public function channelable()
    {
        return $this->morphTo();
    }

    public function orders()
    {
        return $this->hasMany(Order::class, 'channel_id');
    }
}
