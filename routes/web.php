<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});

Route::get('/test', function (\Chang\AmazonMws\Models\Amazon $amazon) {

     $store = $amazon::find(2);
     $mws = $store->runMWS();
     $res = $mws->action(\Chang\AmazonMws\Actions\Sellers\ListMarketplaceParticipations::make());
     return $res;
});
