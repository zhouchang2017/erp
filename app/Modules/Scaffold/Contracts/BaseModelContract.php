<?php

namespace App\Modules\Scaffold\Contracts;


interface BaseModelContract
{
    public static function getFieldsSearchable();

    public function update(array $attributes = [], array $options = []);
}