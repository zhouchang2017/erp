<?php
/**
 * Created by PhpStorm.
 * User: z
 * Date: 2018/9/12
 * Time: 2:51 PM
 */

namespace Chang\AmazonMws\Actions\Reports;

use Chang\AmazonMws\Actions\Action;
use Chang\AmazonMws\Traits\ActionTrait;

class RequestReport extends Action
{
    use ActionTrait;

    public function getMockData()
    {
        $response = <<<EOD
<?xml version="1.0"?>
<RequestReportResponse xmlns="http://mws.amazonaws.com/doc/2009-01-01/">
  <RequestReportResult>
    <ReportRequestInfo>
      <ReportType>_GET_FLAT_FILE_OPEN_LISTINGS_DATA_</ReportType>
      <ReportProcessingStatus>_SUBMITTED_</ReportProcessingStatus>
      <EndDate>2018-09-19T08:44:49+00:00</EndDate>
      <Scheduled>false</Scheduled>
      <ReportRequestId>50647017793</ReportRequestId>
      <SubmittedDate>2018-09-19T08:44:49+00:00</SubmittedDate>
      <StartDate>2017-08-31T16:00:00+00:00</StartDate>
    </ReportRequestInfo>
  </RequestReportResult>
  <ResponseMetadata>
    <RequestId>d4865131-972c-499a-b279-aa5e7197af8f</RequestId>
  </ResponseMetadata>
</RequestReportResponse>
EOD;
        return $response;
    }
}