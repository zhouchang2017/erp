<?php

namespace App\Http\Controllers\Api;

use App\Http\Resources\WarehouseResource;
use App\Modules\Warehouse\Models\Warehouse;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Spatie\QueryBuilder\QueryBuilder;

class WarehouseController extends Controller
{
    public function index()
    {
        return WarehouseResource::collection(QueryBuilder::for(Warehouse::class)->allowedIncludes(Warehouse::getAllowedInclude())->paginate());
    }
}
