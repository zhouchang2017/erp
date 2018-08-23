<?php

namespace App\Modules\Warehouse\Transformers;

use App\Modules\Scaffold\Transformer;
use App\Modules\Warehouse\Models\WarehouseType;

class WarehouseTypeTransformer extends Transformer
{
    protected $availableIncludes = [  ];

    public function __construct($field = null)
    {
        parent::__construct($field);
    }

    public function transform(WarehouseType $type)
    {
        $this->hidden && $type->addHidden($this->hidden);
        return $type->attributesToArray();
    }


}
