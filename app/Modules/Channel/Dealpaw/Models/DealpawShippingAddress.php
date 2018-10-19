<?php

namespace App\Modules\Channel\Dealpaw\Models;

use App\Modules\Channel\Dealpaw\Observers\DealpawShippingAddressObserver;
use App\Modules\Channel\Dealpaw\Services\DealpawService;
use Illuminate\Database\Eloquent\Model;

class DealpawShippingAddress extends Model
{
    protected $fillable = [
        'dealpaw_address_id',
        'first_name',
        'last_name',
        'phone_number',
        'postcode',
        'country_code',
        'province_code',
        'province_name',
        'city',
        'street',
        'user_id',
    ];

    public static $updateFillable = [
        'first_name',
        'last_name',
        'phone_number',
        'postcode',
        'country_code',
        'province_code',
        'province_name',
        'city',
        'street',
    ];

    protected static function boot()
    {
        parent::boot();
        self::observe(DealpawShippingAddressObserver::class);
    }


    public function order()
    {
        return $this->belongsTo(DealpawOrder::class, 'dealpaw_address_id', 'address_id');
    }

    public function syncToDealpaw()
    {
        (new DealpawService($this->order->dealpaw))->syncAddressToDealpaw($this);
    }
}
