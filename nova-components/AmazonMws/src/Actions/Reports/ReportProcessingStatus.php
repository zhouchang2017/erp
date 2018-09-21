<?php
/**
 * Created by PhpStorm.
 * User: z
 * Date: 2018/9/20
 * Time: 2:27 PM
 */

namespace Chang\AmazonMws\Actions\Reports;


class ReportProcessingStatus
{
    public static function all()
    {
        return [
            [
                'name' => '已提交',
                'value' => '_SUBMITTED_',
            ],
            [
                'name' => '处理中',
                'value' => '_IN_PROGRESS_',
            ],
            [
                'name' => '失败',
                'value' => '_CANCELLED_',
            ],
            [
                'name' => '完成',
                'value' => '_DONE_',
            ],
            [
                'name' => '完全但无数据',
                'value' => '_DONE_NO_DATA_',
            ],
        ];
    }
}