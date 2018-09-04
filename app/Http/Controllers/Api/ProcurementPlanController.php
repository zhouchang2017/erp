<?php

namespace App\Http\Controllers\Api;

use App\Http\Resources\ProcurementPlanResource;
use App\Modules\Procurement\Models\ProcurementPlan;
use App\Modules\Procurement\Services\ProcurementServer;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Spatie\QueryBuilder\QueryBuilder;

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

    public function show($id)
    {
        return ProcurementPlanResource::make(
            QueryBuilder::for(ProcurementPlan::class)
                ->allowedIncludes(ProcurementPlan::allowedInclude())
                ->findOrFail($id)
        );
    }

    public function store(Request $request)
    {
        $this->service->createPlan($request->all());
        return response()->json(['msg' => 'Created!'], 201);
    }

    public function update($id, Request $request)
    {
        $this->service->updatePlan($id, $request->all());
        return response()->json(['msg' => 'Updated!'], 201);
    }
}
