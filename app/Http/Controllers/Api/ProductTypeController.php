<?php

namespace App\Http\Controllers\Api;

use App\Modules\Product\Models\ProductType;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class ProductTypeController extends Controller
{
    protected $model;

    public function __construct(ProductType $model)
    {
        $this->model = $model;
    }

    public function show($id)
    {
        return $this->model::with('attributeGroups.values')->findOrFail($id);
    }


}
