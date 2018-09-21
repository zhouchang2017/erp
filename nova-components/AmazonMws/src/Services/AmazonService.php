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
use Chang\AmazonMws\Actions\Reports\GetReport;
use Chang\AmazonMws\Actions\Reports\GetReportRequestList;
use Chang\AmazonMws\Actions\Reports\RequestReport;
use Chang\AmazonMws\Models\Amazon;
use Chang\AmazonMws\MWS;

/**
 * Class AmazonService
 * @package Chang\AmazonMws\Services
 */
class AmazonService
{
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

    public function syncInventory()
    {
        // check local has exist inventory

        // call MWS api Report -> RequestReport -> _GET_FLAT_FILE_OPEN_LISTINGS_DATA_
        $listingsReportId = $this->getRequestReport(
            '_GET_FLAT_FILE_OPEN_LISTINGS_DATA_',
            Carbon::today()->subYear(1)->toIso8601String()
        )->get('RequestReportResponse')
            ->get('RequestReportResult')
            ->get('ReportRequestInfo')
            ->get('ReportRequestId')
            ->get('value');

        $fbaInventoryReportId = $this->getRequestReport(
            '_GET_FBA_MYI_UNSUPPRESSED_INVENTORY_DATA_',
            Carbon::today()->subYear(1)->toIso8601String()
        )->get('RequestReportResponse')
            ->get('RequestReportResult')
            ->get('ReportRequestInfo')
            ->get('ReportRequestId')
            ->get('value');
        // call MWS api Report -> GetReportRequestList
        do {
            $reportRequestInfo = $this->getReportRequestList([$listingsReportId, $fbaInventoryReportId])
                ->get('GetReportRequestListResponse')
                ->get('GetReportRequestListResult')
                ->get('ReportRequestInfo');

            $status = $reportRequestInfo->get('ReportProcessingStatus')->get('value');


            if ($status !== '_DONE_') {
                sleep(10);
            }
        } while ($status !== '_DONE_');

        $generatedReportId = $reportRequestInfo->get('GeneratedReportId')->get('value');
        // call MWS api GetReport
        return $this->getReport($generatedReportId);
        // call MWS api FulfillmentInventory -> ListInventorySupply

//        $this->MWS->action(ListInventorySupply::make());

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

    private function setListParams(string $key, array $data, int $max = -1, int $start = 1)
    {
        $params = [];
        if (count($data) > 0) {
            foreach ($data as $param) {
                $params[$key . '.' . $start] = $param;
                if ($max !== -1 && $max === $start) {
                    $start = 1;
                } else {
                    $start++;
                }

            }
        }
        return $params;
    }


}