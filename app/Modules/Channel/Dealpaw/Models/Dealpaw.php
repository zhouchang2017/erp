<?php

namespace App\Modules\Channel\Dealpaw\Models;

use App\Modules\Channel\ChannelContract;
use App\Modules\Channel\Dealpaw\DealpawClient;
use App\Modules\Channel\Dealpaw\Observers\DealpawObserver;
use App\Modules\Channel\Traits\ChannelTrait;
use Illuminate\Database\Eloquent\Model;

class Dealpaw extends Model implements ChannelContract
{
    use ChannelTrait;

    protected $client;

    protected $fillable = [
        'name',
        'code',
        'description',
        'api_url',
        'api_prefix',
        'header',
        'original_id',
    ];

    protected $casts = [
        'header' => 'array',
    ];

    protected static function boot()
    {
        parent::boot();
        self::observe(DealpawObserver::class);
    }

    public function runClient()
    {
        if (is_null($this->client)) {
            $this->client = new DealpawClient($this);
        }
        return $this->client;
    }

    public function inChannel()
    {
        if (is_null($this->channel)) {
            $this->channel()->create(['name' => $this->name]);
        }
    }

    public function products()
    {
        return $this->belongsToMany(DealpawProduct::class, 'dealpaw_product', 'dealpaw_id', 'dealpaw_product_id');
    }

    public function orders()
    {
        return $this->hasMany(DealpawOrder::class, 'dealpaw_id');
    }

}
