<?php
/**
 * Created by PhpStorm.
 * User: z
 * Date: 2018/9/19
 * Time: 10:47 AM
 */

namespace Chang\AmazonMws\Services;

use Carbon\Carbon;
use Chang\AmazonMws\Actions\FulfillmentInventory\ListInventorySupply;
use Chang\AmazonMws\Actions\Orders\ListOrderItems;
use Chang\AmazonMws\Actions\Orders\ListOrders;
use Chang\AmazonMws\Actions\Products\GetMatchingProductForId;
use Chang\AmazonMws\Actions\Reports\GetReport;
use Chang\AmazonMws\Actions\Reports\GetReportRequestList;
use Chang\AmazonMws\Actions\Reports\RequestReport;
use Chang\AmazonMws\DataTypeModels\ListingType;
use Chang\AmazonMws\DataTypeModels\ListInventorySupplyType;
use Chang\AmazonMws\DataTypeModels\OrderItemType;
use Chang\AmazonMws\DataTypeModels\OrderType;
use Chang\AmazonMws\DataTypeModels\ShippingAddressType;
use Chang\AmazonMws\Models\Amazon;
use Chang\AmazonMws\Models\Order;
use Chang\AmazonMws\MWS;
use Chang\AmazonMws\Traits\ProductsApiTrait;
use Illuminate\Support\Collection;
use Log;

/**
 * Class AmazonService
 * @package Chang\AmazonMws\Services
 */
class AmazonService
{
    use ProductsApiTrait;
    /**
     * @var Amazon
     */
    protected $amazon;

    /**
     * @var MWS
     */
    protected $MWS;


    /**
     * @param Amazon $amazon
     */
    public function setAmazon(Amazon $amazon): void
    {
        $this->amazon = $amazon;
        $this->setMWS();
    }

    /**
     * AmazonService constructor.
     * @param $amazon
     */
    public function __construct(Amazon $amazon)
    {
        $this->amazon = $amazon;
    }

    private function now()
    {
        return Carbon::now()->subMinute(2)->toIso8601String();
    }

    /**
     *
     */
    public function setMWS()
    {
        $this->MWS = $this->amazon->runMWS();
    }

    /**
     * @return MWS
     */
    public function getMWS(): MWS
    {
        return $this->MWS;
    }

    public function syncListings(string $generatedReportId)
    {
        try {
            // call MWS api GetReport store Listings
            $this->reportListingsToStore($this->getReport($generatedReportId));
            // get database 'amazon_listings' all sku
            $skuList = $this->amazon->listings()->pluck('sku')->toArray();
            // call MWS api Products -> GetMatchingProductForId
            $this->getProductsForSkuSyncToStore($skuList);
            return true;
        } catch (\Exception $exception) {
            \Log::error($exception->getMessage());
            return false;
        }
    }


    public function syncInventory($date = null)
    {
        $date = $date ?? Carbon::now()->subYear(2)->toIso8601String();
        // sync fba
        return $this->getListInventorySupplySyncToStore($date);
    }

    /**
     * 将可售商品报告 （“库存报告”）结果保存到数据库 _GET_FLAT_FILE_OPEN_LISTINGS_DATA_
     * @param Collection $data
     */
    private function reportListingsToStore(Collection $data)
    {
        $data->map(function ($listing) {
            $listingType = new ListingType($listing);
            $this->amazon->listings()->updateOrCreate(
                ['sku' => $listingType->sku], $listingType->toArray()
            );
        });
    }

    /**
     * call MWS FulfillmentInventory -> GetListInventorySupply get inventory sync to local store
     * @param string|null $date
     * @param array $skuList
     * @return Collection
     */
    private function getListInventorySupplySyncToStore(string $date = null, array $skuList = [])
    {
        return $this->getListInventorySupply($date, $skuList)
            ->map(function ($inventory) {
                /** @var Collection $inventory */
                $inventoryType = new ListInventorySupplyType($inventory->toArray());
                return $this->amazon->inventories()->updateOrCreate(
                    ['seller_sku' => $inventoryType->seller_sku],
                    $inventoryType->toArray()
                );
            });
    }

    /**
     * 通过商品sku获取商品信息，同步到本地数据库
     * @param array $skuList
     */
    private function getProductsForSkuSyncToStore(array $skuList)
    {
        $this->getMatchingProductForId($skuList)->flatten(1)->map(function ($product) {
            $listingsType = new ListingType($product);
            $this->amazon->listings()->updateOrCreate(
                ['sku' => $listingsType->sku],
                $listingsType->toArray()
            );
        });
    }

    /**
     * @param string|array $reportType
     * @param string|null $startDate 用于选择待报告数据日期范围的起始日期
     * @param string|null $endDate 用于选择待报告数据日期范围的结束日期
     * @param array $marketplaceIdList 一个包含您所注册的一个或多个商城编号的列表。生成的报告将包含您指定的所有商城的信息
     * @param string|null $reportOptions 传递给报告的其他信息
     * @return \Illuminate\Support\Collection
     */
    public function getRequestReport(
        $reportType,
        string $startDate = null,
        string $endDate = null,
        array $marketplaceIdList = [],
        string $reportOptions = null
    ) {
        if (is_array($reportType)) {
            return $this->MWS->action(RequestReport::make($reportType));
        }
        $params = [
            'ReportType' => $reportType,
            'StartDate' => $startDate ?? $this->now(),
            'EndDate' => $endDate ?? $this->now(),
            $this->setListParams('MarketplaceIdList.Id', $marketplaceIdList),
        ];
        if ( !is_null($reportOptions)) {
            $params['ReportOptions'] = $reportOptions;
        }

        return $this->MWS->action(RequestReport::make($params));
    }

    /**
     * @param array $reportRequestIdList ReportRequestId 值的结构化列表。如果您传入 ReportRequestId 的值，则会忽略其他查询条件
     * @param array $reportTypeList ReportType 枚举值的结构化列表
     * @param array $reportProcessingStatusList 报告处理状态的结构化列表，依照其来过滤报告请求
     * @param int $maxCount 非负整数，表明待返回报告请求的最大数量。如果指定一个大于 100 的数字，请求将被拒绝
     * @param string|null $requestedFromDate 用于选择待报告数据日期范围的起始日期，数据格式为 ISO8601
     * @param string|null $requestedToDate 用于选择待报告数据日期范围的结束日期，数据格式为 ISO8601
     * @return \Illuminate\Support\Collection
     */
    public function getReportRequestList(
        array $reportRequestIdList = [],
        array $reportTypeList = [],
        array $reportProcessingStatusList = [],
        int $maxCount = 10,
        string $requestedFromDate = null,
        string $requestedToDate = null
    ) {
        $params = array_merge(
            $this->setListParams('ReportTypeList.Type', $reportTypeList),
            $this->setListParams('ReportRequestIdList.Id', $reportRequestIdList),
            $this->setListParams('ReportProcessingStatusList.Status', $reportProcessingStatusList),
            ['MaxCount' => $maxCount],
            ['RequestedFromDate' => $requestedFromDate ?? Carbon::today()->subMonth(3)->toIso8601String()],
            ['RequestedToDate' => $requestedToDate ?? $this->now()]
        );
        return $this->MWS->action(GetReportRequestList::make($params));
    }

    /**
     * @param string $nextToken
     * @param string|null $action
     * @return \Illuminate\Support\Collection
     */
    public function getReportRequestListByNextToken(string $nextToken, string $action = null)
    {
        return $this->MWS->action(GetReportRequestList::make()->next($nextToken, $action));
    }

    /**
     * @param string $reportId 待下载报告的唯一编码，通过 GetReportList 操作或 ReportRequest 的 GeneratedReportId 而获取
     * @return \Illuminate\Support\Collection
     */
    public function getReport(string $reportId)
    {
        return $this->MWS->action(GetReport::make(['ReportId' => $reportId]));
    }

    /**
     * 根据您指定的商品编码值列表，GetMatchingProductForId 操作会返回一个包含商品及其属性的列表。
     * 可能的商品编号包括：ASIN、GCID、SellerSKU、UPC、EAN、ISBN 和 JAN。
     * @param array $idList
     * @param string $idType
     * @param string|null $marketplaceId
     * @return mixed
     */
    public function getMatchingProductForId(array $idList, string $idType = 'SellerSKU', string $marketplaceId = null)
    {
        return collect($this->setListParams('IdList.Id', $idList, 5))
            ->map(function ($listId) use ($idType, $marketplaceId) {
                return $this->MWS->action(GetMatchingProductForId::make(array_merge($listId, [
                    'IdType' => $idType,
                    'MarketplaceId' => $marketplaceId ?? $this->amazon->marketplaceId,
                ])));
            });
    }

    /**
     * 该 ListInventorySupply 操作可以返回卖家位于亚马逊物流和在当前入库货件中的库存的供应情况相关信息。
     * 您可以查看您的亚马逊物流库存当前的供应状态，还可以找到库存供应状态发生变化的时间。
     * 此操作不会返回库存供应情况的信息，此库存位于：
     * - 无法销售
     * - 绑定买家订单
     *
     * @param string|null $queryStartDateTime
     * @param array $sellerSkus
     * @param string $responseGroup
     * @return Collection|static
     */
    public function getListInventorySupply(
        string $queryStartDateTime = null,
        array $sellerSkus = [],
        $responseGroup = 'Basic'
    ) {

        if (count($sellerSkus) > 0) {
            $sellerSkuArray = $this->setListParams('SellerSkus.member', $sellerSkus, 50);
            return count($sellerSkus) > 50
                ?
                collect($sellerSkuArray)
                    ->map(function ($sellerSku) use ($responseGroup) {
                        return $this->MWS->action(ListInventorySupply::make(array_merge($sellerSku, [
                            'ResponseGroup' => $responseGroup,
                        ])))->get('InventorySupplyList')->get('member');
                    })->flatten(1)
                :
                $this->MWS->action(ListInventorySupply::make(array_merge($sellerSkuArray[0], [
                    'ResponseGroup' => $responseGroup,
                ])))->get('InventorySupplyList')->get('member');
        }

        $current = $this->MWS->action(ListInventorySupply::make([
            'ResponseGroup' => $responseGroup,
            'QueryStartDateTime' => $queryStartDateTime ?? Carbon::today()->subYear(2)->toIso8601String(),
        ]));

        /** @var Collection $response */
        $response = $current->get('InventorySupplyList');

        while ($current->has('NextToken')) {
            /** @var Collection $current */
            $current = $this->getListInventorySupplyByNextToken($current->get('NextToken')->get('value'));

            $response = $response->get('member')->concat($current->get('InventorySupplyList')->get('member'));
        }

        return $response;
    }

    /**
     * 该 ListInventorySupplyByNextToken 操作返回卖家库存状况的下一页信息，通过使用 NextToken 的值来完成此操作，该值是通过您上一步请求
     * ListInventorySupply 或 ListInventorySupplyByNextToken返回。如果未返回 NextToken 的值，则不会返回其他页面。
     * @param string $nextToken
     * @return static
     */
    public function getListInventorySupplyByNextToken(string $nextToken)
    {
        return $this->MWS->action(ListInventorySupply::make()->next($nextToken));
    }

    public function syncOrders()
    {
        $current = $this->getListOrders();

        /** @var Collection $response */
        $response = new Collection();
        $response = $response->concat($current->get('Orders')->get('Order'));

        while ($current->has('NextToken')) {
            sleep(60);
            /** @var Collection $current */
            $current = $this->getListOrdersByNextToken($current->get('NextToken')->get('value'))->first();

            $response = $response->concat($current->get('Orders')->get('Order'));
        }

        Log::info('订单下载完成,总计: ' . $response->count() . '条');
        return $response->map(function ($attribute) {
            /** @var Collection $attribute */
            $orderType = new OrderType($attribute->toArray());

            /** @var Order $order */
            $order = $this->amazon->orders()->updateOrCreate(
                ['amazon_order_id' => $orderType->amazon_order_id],
                $orderType->toArray()
            );
            Log::info('以更新订单 amazon_order_id => ' . $order->amazon_order_id);
            $this->syncOrderItems($order);
            sleep(3);
            if ($orderType->shipping_address) {
                $address = new ShippingAddressType($orderType->shipping_address);
                $order->shippingAddress()->updateOrCreate(
                    ['order_id' => $order->id],
                    $address->toArray()
                );
            }
            return $order;
        });
    }

    public function getListOrders(array $params = [])
    {
        if ( !array_key_exists('CreatedAfter', $params)) {
            $params['CreatedAfter'] = Carbon::now()->subYear(2)->toIso8601String();
        }
        if ( !array_key_exists('MarketplaceId', $params)) {
            $params['MarketplaceId.Id.1'] = $this->amazon->marketplaceId;
        }
        return $this->MWS->action(ListOrders::make($params))
            ->pluck('ListOrdersResult')->first();
    }

    public function getListOrdersByNextToken(string $nextToken)
    {
        return $this->MWS->action(ListOrders::make()->next($nextToken))->pluck('ListOrdersByNextTokenResult');
    }

    /**
     * 同步订单商品
     * @param Order $order
     * @return Collection
     */
    public function syncOrderItems(Order $order)
    {
        return $this->getListOrderItems($order->amazon_order_id)
            ->map(function ($item) use ($order) {
                /** @var Collection $item */
                $orderItemType = new OrderItemType($item->toArray());
                $orderItemType->setAttribute('amazon_order_id', $order->amazon_order_id);
                $order->items()->updateOrCreate(
                    ['order_item_id' => $orderItemType->order_item_id],
                    $orderItemType->toArray()
                );
                Log::info('完成更新 amazon_order_id => ' . $order->amazon_order_id . ' 订单产品，order_item_id => ' . $orderItemType->order_item_id);
                return $order;
            });
    }

    public function getListOrderItems(string $amazonOrderId, $next = true)
    {
        $current = $this->MWS->action(ListOrderItems::make([
            'AmazonOrderId' => $amazonOrderId,
        ]));

        if ( !$next) {
            return $current->get('OrderItems')->get('OrderItem');
        }
        /** @var Collection $response */
        $response = new Collection();
        $response = $response->concat($current->get('OrderItems')->get('OrderItem'));

        while ($current->has('NextToken')) {
            /** @var Collection $current */
            $current = $this->getListOrderItemsByNextToken($current->get('NextToken')->get('value'));

            $response = $response->concat($current->get('OrderItems')->get('OrderItem'));
        }

        return $response;
    }

    public function getListOrderItemsByNextToken(string $nextToken)
    {
        return $this->MWS->action(ListOrderItems::make()->next($nextToken));
    }


    private function setListParams(string $key, array $data, int $max = -1, int $start = 1)
    {
        $length = count($data);
        $params = [];
        if ($length > 0) {
            $round = 0;
            foreach ($data as $param) {
                if ($max > -1) {
                    $params[$round][$key . '.' . $start] = $param;
                } else {
                    $params[$key . '.' . $start] = $param;
                }
                if ($max !== -1 && $max === $start) {
                    $round++;
                    $start = 1;
                } else {
                    $start++;
                }
            }
        }
        return $params;
    }

//    public function __call($name, $arguments)
//    {
//        if(ends_with($name,'ByNextToken')){
//            preg_match("/([^\s]+)ByNextToken$/",$name,$parser);
//            $method = $parser[1];
//            return $this->$method($arguments);
//        }
//    }


}