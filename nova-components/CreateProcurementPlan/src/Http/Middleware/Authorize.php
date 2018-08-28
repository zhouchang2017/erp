<?php

namespace Zhouchang\CreateProcurementPlan\Http\Middleware;

use Zhouchang\CreateProcurementPlan\CreateProcurementPlan;

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
        return resolve(CreateProcurementPlan::class)->authorize($request) ? $next($request) : abort(403);
    }
}
