<?php

namespace App\Http\Controllers\Api;

use App\Http\Resources\ManuallyResource;
use App\Modules\Warehouse\Models\Manually;
use App\Modules\Warehouse\Services\ManuallyService;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Spatie\QueryBuilder\QueryBuilder;

class ManuallyController extends Controller
{
    protected $service;

    /**
     * ManuallyController constructor.
     * @param $service
     */
    public function __construct(ManuallyService $service)
    {
        $this->service = $service;
    }

    public function show($id)
    {
        return ManuallyResource::make(
            QueryBuilder::for(Manually::class)
                ->allowedIncludes(Manually::allowedInclude())
                ->findOrFail($id)
        );
    }

    public function store(Request $request)
    {
        $this->service->create($request->all());
        return response()->json(['msg' => 'Created!'], 201);
    }

    public function update($id, Request $request)
    {
        $this->service->updatePlan($id, $request->all());
        return response()->json(['msg' => 'Updated!'], 201);
    }

}
