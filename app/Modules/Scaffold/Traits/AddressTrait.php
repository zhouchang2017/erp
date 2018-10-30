<?php

namespace App\Modules\Scaffold\Traits;


use App\Modules\Scaffold\Models\Address;

trait AddressTrait
{

    /**
     * @return string
     */
    public function getAddressMethod(): string
    {
        return 'addresses';
    }

    public function addresses()
    {
        return $this->morphMany(Address::class, 'addressable');
    }

    public function address()
    {
        return $this->morphOne(Address::class,'addressable');
    }


}