<?php

namespace App\Http\Controllers\Api;

use App\Modules\Procurement\Services\ProcurementServer;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class ProcurementPlanController extends Controller
{
    protected $service;

    /**
     * ProcurementPlanController constructor.
     * @param $service
     */
    public function __construct(ProcurementServer $service)
    {
        $this->service = $service;
    }

    public function store(Request $request)
    {
        $this->service->createPlan($request->all());
        return response('created!', 201);
    }
}
