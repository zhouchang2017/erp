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
//    $res = $mws->action(\Chang\AmazonMws\Actions\Products\GetMatchingProduct::make(
//        [
//            'MarketplaceId' => 'ATVPDKIKX0DER',
//            'ASINList.ASIN.1' => 'B075YC3L3Q',
//        ], true
//    ));
//    $res = $mws->action(\Chang\AmazonMws\Actions\FulfillmentInventory\ListInventorySupply::make([
//        'QueryStartDateTime' => Carbon::createFromDate(2018, 5, 20)->toIso8601String(),
//        'ResponseGroup' => 'Detailed',
//    ]));
//    $res = $mws->action(\Chang\AmazonMws\Actions\Reports\RequestReport::make(
//        [
//            'ReportType' => '_GET_FLAT_FILE_OPEN_LISTINGS_DATA_',
//            'StartDate' => Carbon::today()->subYear()->toIso8601String()
//        ]
//    ));
//    $res = $mws->action(\Chang\AmazonMws\Actions\Reports\GetReportRequestList::make());
    $res = $mws->action(\Chang\AmazonMws\Actions\Reports\GetReport::make([
        'ReportId' => '11255375117017788',
    ]));
    $products = $res->chunk(5)->map(function ($item) use ($mws) {
        static $num = 0;
        $params = array_merge(
            collect($item)->mapWithKeys(function ($product) use (&$num) {
                $num++;
                return ['IdList.Id.' . $num => $product['sku']];
            })->tap(function ($collect) use (&$num) {
                $num = 0;
            })->toArray(),
            [
                'IdType' => 'SellerSKU',
                'MarketplaceId' => 'ATVPDKIKX0DER',
            ]
        );
        return $mws->action(\Chang\AmazonMws\Actions\Products\GetMatchingProductForId::make($params));
    });

    return $products;
});

Route::get('/test/1', function () {
    $content = \Illuminate\Support\Facades\Storage::get('test.txt');
    $arr = explode("\r\n", $content);
    $header = explode("\t", array_shift($arr));
    array_pop($arr);
    $res = collect($arr)->map(function ($item) use ($header) {
        $temp = explode("\t", $item);
        return array_combine($header, $temp);
    });
    return $res;
});
