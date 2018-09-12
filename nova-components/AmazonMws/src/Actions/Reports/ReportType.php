<?php
/**
 * Created by PhpStorm.
 * User: z
 * Date: 2018/9/12
 * Time: 3:11 PM
 */

namespace Chang\AmazonMws\Actions\Reports;


class ReportType
{
    public static function getInventoryType()
    {
        return [
            [
                'name' => '可售商品报告 （“库存报告”）',
                'description' => '制表符分隔的、文本文件格式的可售商品报告，包含 SKU、ASIN、价格和数量输入项。针对商城和卖家平台卖家。',
                'value' => '_GET_FLAT_FILE_OPEN_LISTINGS_DATA_',
            ],
            [
                'name' => '可售商品报告',
                'description' => '制表符分隔的、文本文件格式的可售商品报告。',
                'value' => '_GET_MERCHANT_LISTINGS_DATA_BACK_COMPAT_',
            ],
            [
                'name' => '卖家商品报告 （“在售商品报告”）',
                'description' => '制表符分隔的、文本文件格式的详细在售商品报告。针对商城和卖家平台卖家。',
                'value' => '_GET_MERCHANT_LISTINGS_DATA_',
            ],
            [
                'name' => '卖家商品报告（精简版） （“可售商品报告精简版”）',
                'description' => '制表符分隔的、文本文件格式的可售商品报告，仅包含数量大于零的商品的 SKU、ASIN、价格和数量输入项。针对商城和卖家平台卖家。',
                'value' => '_GET_MERCHANT_LISTINGS_DATA_LITE_',
            ],
            [
                'name' => '卖家商品报告（精简升级版） （“可售商品报告精简升级版”）',
                'description' => '制表符分隔的、文本文件格式的可售商品报告，仅包含数量大于零的商品的 SKU 和数量输入项。针对商城和卖家平台卖家。',
                'value' => '_GET_MERCHANT_LISTINGS_DATA_LITER_',
            ],
            [
                'name' => '已售商品报告',
                'description' => '制表符分隔的、文本文件格式的已售商品报告，包含商品在亚马逊平台销售情况。针对商城和卖家平台卖家。',
                'value' => '_GET_CONVERGED_FLAT_FILE_SOLD_LISTINGS_DATA_',
            ],
            [
                'name' => '已取消的商品报告',
                'description' => '制表符分隔的、文本文件格式的已取消商品报告。针对商城和卖家平台卖家。',
                'value' => '_GET_MERCHANT_CANCELLED_LISTINGS_DATA_',
            ],
            [
                'name' => '商品信息质量报告 （“商品信息质量和阻止上传的商品信息报告”）',
                'description' => '制表符分隔的、文本文件格式的商品信息质量报告，包含以下输入项：SKU、商品名称、ASIN、输入项名称、警告类型、当前价格、上次更新日期、警告名称以及状态。针对商城和卖家平台卖家。',
                'value' => '_GET_MERCHANT_LISTINGS_DEFECT_DATA_',
            ],
        ];
    }

    public static function getOrderType()
    {
        return [
            [
                'name' => '待处理订单报告',
                'value' => '_GET_FLAT_FILE_ACTIONABLE_ORDER_DATA_',
            ],
            [
                'name' => '请求或计划的、文本文件格式的订单报告',
                'value' => '_GET_FLAT_FILE_ORDERS_DATA_',
            ],
            [
                'name' => '文本文件格式的订单报告',
                'value' => '_GET_CONVERGED_FLAT_FILE_ORDER_REPORT_DATA_',
            ],
        ];
    }

    public static function getOrderTrackingType()
    {
        return [
            [
                'name' => '文本文件格式的、按最后更新日期排列的订单报告',
                'value' => '_GET_FLAT_FILE_ALL_ORDERS_DATA_BY_LAST_UPDATE_',
            ],
            [
                'name' => '文本文件格式的、按订单日期排列的订单报告',
                'value' => '_GET_FLAT_FILE_ALL_ORDERS_DATA_BY_ORDER_DATE_',
            ],
            [
                'name' => 'XML 格式的、按最后更新日期排列的订单报告',
                'value' => '_GET_XML_ALL_ORDERS_DATA_BY_LAST_UPDATE_',
            ],
            [
                'name' => 'XML 格式的、按订单日期排列的订单报告',
                'value' => '_GET_XML_ALL_ORDERS_DATA_BY_ORDER_DATE_',
            ],
        ];
    }

    public static function getPendingOrderType()
    {
        return [
            [
                'name' => '文本文件格式的等待中订单报告',
                'value' => '_GET_FLAT_FILE_PENDING_ORDERS_DATA_',
            ],
            [
                'name' => 'XML 格式的、等待中订单报告',
                'value' => '_GET_PENDING_ORDERS_DATA_',
            ],
            [
                'name' => '文本文件格式的综合等待中订单报告',
                'value' => '_GET_CONVERGED_FLAT_FILE_PENDING_ORDERS_DATA_',
            ],
        ];
    }
}