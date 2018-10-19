<?php

namespace Chang\AmazonMws\Models;

use App\Modules\Channel\ChannelContract;
use App\Modules\Channel\Traits\ChannelTrait;
use Chang\AmazonMws\Traits\ProductsApiTrait;
use Illuminate\Database\Eloquent\Model;
use Chang\AmazonMws\MWS;
use Laravel\Nova\Actions\Actionable;

class Amazon extends Model implements ChannelContract
{
    use ProductsApiTrait, Actionable, ChannelTrait;
    /**
     * @var MWS|null
     */
    protected $MWS = null;

    protected $fillable = [
        'name',
        'description',
        'seller_id',
        'mws_auth_token',
        'aws_access_key_id',
        'secret_key',
        'country',
        'enabled',
    ];

    protected $casts = [
        'enabled' => 'boolean',
        'country' => 'array',
        'sync_at' => 'date',
    ];

    public $marketplaceId = 'ATVPDKIKX0DER';

    /**
     * @return MWS
     */
    public function runMWS(): MWS
    {
        if (is_null($this->MWS)) {
            $this->MWS = new MWS($this);
        }
        return $this->MWS;
    }

    public function ListMarketplaceParticipations()
    {
        $this->runMWS();
    }

    public function getHasInventoryAttribute()
    {
        return $this->inventories()->count() > 0;
    }

    public function inventories()
    {
        return $this->hasMany(Inventory::class);
    }

    public function listings()
    {
        return $this->hasMany(Listing::class, 'amazon_id', 'id');
    }

    public function orders()
    {
        return $this->hasMany(Order::class, 'amazon_id', 'id');
    }

    public function inChannel()
    {
        if ($this->channel->count() === 0) {
            $this->channel()->create(['name' => $this->name]);
        }
    }
}
