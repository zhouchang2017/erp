<?php

namespace Chang\AmazonMws\Models;

use Illuminate\Database\Eloquent\Model;

class ShippingAddress extends Model
{
    protected $fillable = [
        'name',
        'address_line_1',
        'address_line_2',
        'address_line_3',
        'city',
        'county',
        'district',
        'state_or_region',
        'postal_code',
        'country_code',
        'phone',
    ];
}
