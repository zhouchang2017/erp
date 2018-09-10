<?php

namespace App\Modules\Channel\Models;

use App\Modules\Scaffold\BaseModel as Model;

class Amazon extends Model
{
    protected $fillable = [
        'name',
        'description',
        'seller_id',
        'mws_auth_token',
        'aws_access_key_id',
        'secret_key',
        'enabled',
    ];

    protected $casts = [
        'enabled' => 'boolean',
    ];
}
