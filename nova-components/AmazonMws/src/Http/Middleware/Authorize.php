<?php

namespace Chang\AmazonMws\Http\Middleware;

use Chang\AmazonMws\AmazonMws;

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
        return resolve(AmazonMws::class)->authorize($request) ? $next($request) : abort(403);
    }
}
