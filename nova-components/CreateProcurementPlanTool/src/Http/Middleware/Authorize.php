<?php

namespace Chang\CreateProcurementPlanTool\Http\Middleware;

use Chang\CreateProcurementPlanTool\CreateProcurementPlanTool;

class Authorize
{
    /**
     * Handle the incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return \Illuminate\Http\Response
     */
    public function handle($request, $next)
    {
        return resolve(CreateProcurementPlanTool::class)->authorize($request) ? $next($request) : abort(403);
    }
}
