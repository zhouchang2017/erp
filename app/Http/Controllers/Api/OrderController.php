<?php

namespace App\Http\Controllers\Api;

use App\Modules\Order\Contracts\OrderContract;
use App\Modules\Channel\Dealpaw\Models\DealpawOrder;
use App\Modules\Order\Services\OrderServer;
use Chang\AmazonMws\Models\Amazon;
use Chang\AmazonMws\Models\Order as AmazonOrder;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class OrderController extends Controller
{
    protected $types = [
        'dealpaw' => DealpawOrder::class,
        'amazon' => AmazonOrder::class,
    ];

    protected $service;

    /**
     * OrderController constructor.
     * @param $service
     */
    public function __construct(OrderServer $service)
    {
        $this->service = $service;
    }

    public function storeForDealpaw(Request $request)
    {
        return $this->service->createForDealpaw($request->all());
    }

    public function updateForDealpaw($number, Request $request)
    {
        return $this->service->updateForDealpaw($number, $request->all());
    }


    public function store(string $type, Request $request)
    {
        if ($this->validateType($type)) {
            $typeModel = $this->getTypeModel($type);
            $this->validate($request, $typeModel::rules(), $typeModel::messages());
            return $this->service->create($request->all(), $typeModel);
        }
        return response()->json(['msg' => $type . '该类型订单暂未支持'], 429);
    }

    public function storeForAmazon()
    {
        $amazon = Amazon::find(1);

        return $amazon->orders->map(function ($order) {
            return $this->service->createForAmazon($order);
        });

    }

    /**
     * @param string $type
     * @return OrderContract
     */
    private function getTypeModel(string $type)
    {
        return app(array_get($this->types, $type));
    }

    private function validateType(string $type)
    {
        return in_array($type, array_keys($this->types));
    }

}
