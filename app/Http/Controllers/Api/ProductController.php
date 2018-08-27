<?php

namespace App\Http\Controllers\Api;

use App\Modules\Product\Services\ProductService;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class ProductController extends Controller
{
    protected $service;

    public function __construct(ProductService $service)
    {
        $this->service = $service;
    }

    public function updateOrCreateAttributes($id, Request $request)
    {
        $res = $this->service->updateOrCreateAttributes($id, $request->all());
        return response()->json(['data' => $res]);
    }
}
