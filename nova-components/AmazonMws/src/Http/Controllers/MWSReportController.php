<?php
/**
 * Created by PhpStorm.
 * User: z
 * Date: 2018/9/18
 * Time: 2:15 PM
 */

namespace Chang\AmazonMws\Http\Controllers;

use Carbon\Carbon;
use Chang\AmazonMws\Actions\Reports\ReportProcessingStatus;
use Chang\AmazonMws\Actions\Reports\ReportType;
use Chang\AmazonMws\Services\AmazonService;
use Illuminate\Http\Request;

class MWSReportController extends Controller
{
    protected $service;

    /**
     * MWSReportController constructor.
     * @param $service
     */
    public function __construct(AmazonService $service)
    {
        $this->service = $service;
    }

    public function list($amazon)
    {
        $this->service->setAmazon($amazon);
        return response()->json($this->service->getReportRequestList());
    }

    public function next($amazon, Request $request)
    {
        $nextToken = $request->input('nextToken');
        $this->service->setAmazon($amazon);
        $res = $this->service->getReportRequestListByNextToken($nextToken)->toArray();
        $res['GetReportRequestListResponse'] = $res['GetReportRequestListByNextTokenResponse'];
        unset($res['GetReportRequestListByNextTokenResponse']);
        $res['GetReportRequestListResponse']['GetReportRequestListResult'] = $res['GetReportRequestListResponse']['GetReportRequestListByNextTokenResult'];
        unset($res['GetReportRequestListResponse']['GetReportRequestListByNextTokenResult']);
        return response()->json($res);
    }

    public function show($amazon, $id)
    {
        $this->service->setAmazon($amazon);
        return response()->json($this->service->getReport($id));
    }

    public function types()
    {
        return ReportType::all();
    }

    public function status()
    {
        return ReportProcessingStatus::all();
    }

    public function requestReport($amazon, Request $request)
    {
        $this->validate($request, [
            'report_type' => 'required',
            'start_date' => 'nullable|date|before:now',
            'end_date' => 'nullable|date|before:now',
        ]);
        $params = collect($request->all())->filter()->mapWithKeys(function ($item, $key) {
            if (in_array($key, ['start_date', 'end_date'])) {
                $item = Carbon::createFromTimeString($item)->toIso8601String();
            }
            return [studly_case($key) => $item];
        });
        if ($params->has('MarketplaceId')) {
            $marketplaceIds = $params->pull('MarketplaceId');
            collect(json_decode($marketplaceIds, true))->each(function ($item, $key) use ($params) {
                $params->put('MarketplaceIdList.id.' . ($key + 1), $item['id']);
            });
        }
        $this->service->setAmazon($amazon);
        return $this->service->getRequestReport($params->toArray());
    }
}