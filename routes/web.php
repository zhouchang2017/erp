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

Route::get('/test1', function (\Chang\AmazonMws\Models\Amazon $amazon) {

    /** @var \Chang\AmazonMws\Models\Amazon $store */
    $store = $amazon::find(2);
    $mws = new \Chang\AmazonMws\Services\AmazonService($store);
    $mws->setMWS();
//    return $mws->getListInventorySupply(Carbon::today()->subYear(2)->toIso8601String());
    return $mws->getListInventorySupply(null, [
        '46-0VRH-50W0-USFBA',
        'DF-9KV9-9OSE-USFBA',
        'EX-4FCD-IO2F-USFBA',
        'V1-X3CE-1WO9-USFBA',
    ]);
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

Route::get('/test2', function () {
    $store = \Chang\AmazonMws\Models\Amazon::find(2);
//    return $store->getMatchingProductForId()->map(function ($product) {
//        return \Chang\AmazonMws\Models\Listing::create($product);
//    });
    $service = new \Chang\AmazonMws\Services\AmazonService($store);
    $service->setMWS();
    return $service->syncOrders();
});

Route::get('/test3', function () {
    $amazon = \Chang\AmazonMws\Models\Amazon::find(1);
    \Chang\AmazonMws\Jobs\SyncOrdersJob::dispatch($amazon);
    return 'start';
});

Route::get('/test4', function () {
    $arr = [
        "LatestShipDate" => [
            "value" => "2017-10-10T06:32:24Z",
        ],
        "OrderType" => [
            "value" => "StandardOrder",
        ],
        "PurchaseDate" => [
            "value" => "2017-10-09T07:04:25Z",
        ],
        "IsReplacementOrder" => [
            "value" => "false",
        ],
        "LastUpdateDate" => [
            "value" => "2017-10-10T06:35:17Z",
        ],
        "BuyerEmail" => [
            "value" => "y53rjxsnkw77cdw@marketplace.amazon.com",
        ],
        "AmazonOrderId" => [
            "value" => "112-3355882-4066616",
        ],
        "NumberOfItemsShipped" => [
            "value" => "1",
        ],
        "ShipServiceLevel" => [
            "value" => "SecondDay",
        ],
        "OrderStatus" => [
            "value" => "Shipped",
        ],
        "SalesChannel" => [
            "value" => "Amazon.com",
        ],
        "IsBusinessOrder" => [
            "value" => "false",
        ],
        "NumberOfItemsUnshipped" => [
            "value" => "0",
        ],
        "PaymentMethodDetails" => [
            "PaymentMethodDetail" => [
                "value" => "Standard",
            ],
        ],
        "BuyerName" => [
            "value" => "2195086964",
        ],
        "OrderTotal" => [
            "CurrencyCode" => [
                "value" => "USD",
            ],
            "Amount" => [
                "value" => "16.99",
            ],
        ],
        "IsPremiumOrder" => [
            "value" => "false",
        ],
        "EarliestShipDate" => [
            "value" => "2017-10-10T06:32:24Z",
        ],
        "MarketplaceId" => [
            "value" => "ATVPDKIKX0DER",
        ],
        "FulfillmentChannel" => [
            "value" => "AFN",
        ],
        "PaymentMethod" => [
            "value" => "Other",
        ],
        "ShippingAddress" => [
            "City" => [
                "value" => "PORTAGE",
            ],
            "PostalCode" => [
                "value" => "46368-1598",
            ],
            "StateOrRegion" => [
                "value" => "IN",
            ],
            "CountryCode" => [
                "value" => "US",
            ],
            "Name" => [
                "value" => "Kandi Gutierrez",
            ],
            "AddressLine1" => [
                "value" => "5641 VANESSA AVE",
            ],
        ],
        "IsPrime" => [
            "value" => "false",
        ],
        "ShipmentServiceLevelCategory" => [
            "value" => "SecondDay",
        ],
        "SellerOrderId" => [
            "value" => "112-3355882-4066616",
        ],
    ];

    $model = new \Chang\AmazonMws\DataTypeModels\OrderType($arr);
    dd($model->shipping_address);
    $amazon = \Chang\AmazonMws\Models\Amazon::find(2);
    $order = $amazon->orders()->create($model->toArray());
    $order->shippingAddress()->create($model->shipping_address);
    return $order;
});

Route::get('/test5', function () {
    $amazon = \Chang\AmazonMws\Models\Amazon::find(2);
    $products = $amazon->runMWS()->action(\Chang\AmazonMws\Actions\Products\GetMatchingProductForId::make([
        'IdType' => 'SellerSKU',
        'MarketplaceId' => $amazon->marketplaceId,
        'IdList.Id.1' => '4B-A3VM-6QU3-USFBA',
        'IdList.Id.2' => 'HS-A9UA-1NEJ-USFBA',
    ]));
    return $products->map(function ($product) {
        return new \Chang\AmazonMws\DataTypeModels\ListingType($product);
    })->pluck('sku');
});

Route::get('/test6', function () {
    $amazon = \Chang\AmazonMws\Models\Amazon::find(1);
    $service = new \Chang\AmazonMws\Services\AmazonService($amazon);
    $service->setMWS();

    $orders = $amazon->orders()->whereId(35)->get();


    $orders->each(function ($order) use ($service) {
        $service->syncOrderItems($order);
    });
    dd($orders);
    return $orders;
});


Route::get('/test7', function (\App\Modules\Channel\Dealpaw\Models\Dealpaw $dealpaw) {
    $m = $dealpaw::find(1);
    $service = new \App\Modules\Channel\Dealpaw\Services\DealpawService($m);
    $service->syncProducts();
});