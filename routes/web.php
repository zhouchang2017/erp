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

    /** @var \Chang\AmazonMws\Models\Amazon $store */
    $store = $amazon::find(2);
    $mws = new \Chang\AmazonMws\Services\AmazonService($store);
    $mws->setMWS();
    return $mws->getMWS()->action(\Chang\AmazonMws\Actions\Reports\GetReportScheduleList::make());
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
//        'QueryStartDateTime' => Carbon::today()->subYear(2)->toIso8601String(),
//        'ResponseGroup' => 'Detailed',
//    ]));
//    $res = $mws->action(\Chang\AmazonMws\Actions\Reports\RequestReport::make(
//        [
//            'ReportType' => '_GET_FBA_MYI_UNSUPPRESSED_INVENTORY_DATA_',
//            'StartDate' => Carbon::today()->subYear(1)->toIso8601String()
//        ]
//    ));
//    $res = $mws->action(\Chang\AmazonMws\Actions\Reports\GetReportRequestList::make());
//    $res = $mws->action(\Chang\AmazonMws\Actions\Reports\GetReport::make([
//        'ReportId' => '11331655667017793',
//    ]));
//    $data = $res->map(function ($item) {
//        $attr = array_only($item, ['sku', 'asin', 'price', 'quantity', 'business_price']);
//        if ($attr['quantity'] === "") {
//            $attr['quantity'] = 0;
//        }
//        if ($attr['business_price'] === "") {
//            $attr['business_price'] = 0;
//        }
//        $option = array_except($item, ['sku', 'asin', 'price', 'quantity', 'business_price']);
//        return array_merge($attr, [
//            'business_price_options' => $option,
//        ]);
//    });
//    return $store->inventories()->createMany($data->toArray());
//    $fetchProduct = $mws->action(\Chang\AmazonMws\Actions\Products\GetMatchingProductForId::make([
//        'IdList.Id.1' => 'SEKEN-CABLE',
//        'IdType' => 'SellerSKU',
//        'MarketplaceId' => 'ATVPDKIKX0DER',
//    ]));
});

Route::get('/test/1', function () {
    $store = \Chang\AmazonMws\Models\Amazon::find(2);
    return $store->getMatchingProductForId()->map(function ($product) {
        return \Chang\AmazonMws\Models\Listing::create($product);
    });
});
