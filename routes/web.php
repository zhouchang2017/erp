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

use Carbon\Carbon;

Route::get('/', function () {
    return view('welcome');
});

Route::get('/test', function (\Chang\AmazonMws\Models\Amazon $amazon) {

    $store = $amazon::find(2);
    $mws = $store->runMWS();
//    $res = $mws->action(\Chang\AmazonMws\Actions\Orders\ListOrders::make([
//        'CreatedAfter' => Carbon::createFromDate(2018, 8, 20)->toIso8601String(),
//        'MarketplaceId.Id.1' => 'ATVPDKIKX0DER',
//    ]));
    $res = $mws->action(\Chang\AmazonMws\Actions\Products\GetMatchingProduct::make(
        [
            'MarketplaceId' => 'ATVPDKIKX0DER',
            'ASINList.ASIN.1' => 'B075YC3L3Q',
        ]
    ));
    return $res;
});

Route::get('/test/1', function () {
    $content = \Illuminate\Support\Facades\Storage::get('test.txt');
    $arr = explode("\r\n", $content);
//    $header = $arr[0];
    $header = explode("\t", array_shift($arr));
    array_pop($arr);
    $res = collect($arr)->map(function ($item) use ($header) {
        $temp = explode("\t", $item);
        return array_combine($header, $temp);
    });
    return $res;
});
