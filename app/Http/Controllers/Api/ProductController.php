<?php

namespace App\Http\Controllers\Api;

use App\Http\Resources\ProductResource;
use App\Modules\DealpawProduct\Models\ProductOption;
use App\Modules\DealpawProduct\ProductAttribute;
use App\Modules\Product\Models\Product;
use App\Modules\Product\Services\ProductService;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Spatie\MediaLibrary\Models\Media;

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

    public function index()
    {
        return ProductResource::collection($this->service->query()->paginate());
    }

    public function list()
    {
//        return \App\Modules\DealpawProduct\Models\Product::find(6)->options()->with('values')->get();
        return \App\Modules\DealpawProduct\Models\Product::with(['variants.optionValues','variants.price'])->where('id',11)->get();
    }
}
