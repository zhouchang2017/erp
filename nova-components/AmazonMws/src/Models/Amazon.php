<?php

namespace Chang\AmazonMws\Models;

use Chang\AmazonMws\Traits\MWSTrait;
use Illuminate\Database\Eloquent\Model;
use Chang\AmazonMws\MWS;

class Amazon extends Model
{
    use MWSTrait;
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
    ];

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

    public function inventories()
    {
        return $this->hasMany(Inventory::class);
    }
}
