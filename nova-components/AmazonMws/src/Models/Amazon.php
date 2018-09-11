<?php

namespace Chang\AmazonMws\Models;

use Illuminate\Database\Eloquent\Model;
use Chang\AmazonMws\MWS;

class Amazon extends Model
{
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

    public function runMWS()
    {
        if ( !$this->enabled) {
            return false;
        }
        if (is_null($this->MWS)) {
            $this->MWS = new MWS(array_except($this->toArray(),
                ['id', 'description', 'enabled', 'created_at', 'updated_at']));
        }
        return $this->MWS;
    }

    public function ListMarketplaceParticipations()
    {
        $this->runMWS();
    }
}
