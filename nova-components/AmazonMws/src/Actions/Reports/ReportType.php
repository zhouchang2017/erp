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

    public static function getFulfillmentFbaType()
    {
        return [
            [
                'name' => '亚马逊物流货件报告',
                'value' => '_GET_AMAZON_FULFILLED_SHIPMENTS_DATA_',
            ],
            [
                'name' => '文本文件格式的、按最后更新日期排列的所有库存订单报告',
                'value' => '_GET_FLAT_FILE_ALL_ORDERS_DATA_BY_LAST_UPDATE_',
            ],
            [
                'name' => '按订单日期排列的所有库存数据文件订单报告',
                'value' => '_GET_FLAT_FILE_ALL_ORDERS_DATA_BY_ORDER_DATE_',
            ],
            [
                'name' => 'XML 文件格式的、按最后更新日期排列的所有订单报告',
                'value' => '_GET_XML_ALL_ORDERS_DATA_BY_LAST_UPDATE_',
            ],
            [
                'name' => 'XML 文件格式的、按订单日期排列的所有订单报告',
                'value' => '_GET_XML_ALL_ORDERS_DATA_BY_ORDER_DATE_',
            ],
            [
                'name' => '亚马逊物流买家货件销售报告',
                'value' => '_GET_FBA_FULFILLMENT_CUSTOMER_SHIPMENT_SALES_DATA_',
            ],
            [
                'name' => '亚马逊物流促销报告',
                'value' => '_GET_FBA_FULFILLMENT_CUSTOMER_SHIPMENT_PROMOTION_DATA_',
            ],
            [
                'name' => '亚马逊物流买家税费',
                'value' => '_GET_FBA_FULFILLMENT_CUSTOMER_TAXES_DATA_',
            ],
            [
                'name' => '亚马逊物流库存报告',
                'value' => '_GET_AFN_INVENTORY_DATA_',
            ],
            [
                'name' => '亚马逊物流每日库存历史报告',
                'value' => '_GET_FBA_FULFILLMENT_CURRENT_INVENTORY_DATA_',
            ],
            [
                'name' => '亚马逊物流每月库存历史报告',
                'value' => '_GET_FBA_FULFILLMENT_MONTHLY_INVENTORY_DATA_',
            ],
            [
                'name' => '亚马逊物流已收到库存报告',
                'value' => '_GET_FBA_FULFILLMENT_INVENTORY_RECEIPTS_DATA_',
            ],
            [
                'name' => '亚马逊物流库存事件详情报告',
                'value' => '_GET_FBA_FULFILLMENT_INVENTORY_SUMMARY_DATA_',
            ],
            [
                'name' => '亚马逊物流库存盘点报告',
                'value' => '_GET_FBA_FULFILLMENT_INVENTORY_ADJUSTMENTS_DATA_',
            ],
            [
                'name' => '亚马逊物流库存状况报告',
                'value' => '_GET_FBA_FULFILLMENT_INVENTORY_HEALTH_DATA_',
            ],
            [
                'name' => '亚马逊物流管理库存',
                'value' => '_GET_FBA_MYI_UNSUPPRESSED_INVENTORY_DATA_',
            ],
            [
                'name' => '亚马逊物流管理库存 - 存档',
                'value' => '_GET_FBA_MYI_ALL_INVENTORY_DATA_',
            ],
            [
                'name' => '亚马逊物流入库绩效报告',
                'value' => '_GET_FBA_FULFILLMENT_INBOUND_NONCOMPLIANCE_DATA_',
            ],
            [
                'name' => '亚马逊物流危险品状态更改报告',
                'value' => '_GET_FBA_HAZMAT_STATUS_CHANGE_DATA_',
            ],
            [
                'name' => '亚马逊物流预计费用报告',
                'value' => '_GET_FBA_ESTIMATED_FBA_FEES_TXT_DATA_',
            ],
            [
                'name' => '亚马逊物流赔偿报告',
                'value' => '_GET_FBA_REIMBURSEMENTS_DATA_',
            ],
            [
                'name' => '亚马逊物流退货报告',
                'value' => '_GET_FBA_FULFILLMENT_CUSTOMER_RETURNS_DATA_',
            ],
            [
                'name' => '亚马逊物流换货报告',
                'value' => '_GET_FBA_FULFILLMENT_CUSTOMER_SHIPMENT_REPLACEMENT_DATA_',
            ],
            [
                'name' => '亚马逊物流建议移除商品报告',
                'value' => '_GET_FBA_RECOMMENDED_REMOVAL_DATA_',
            ],
            [
                'name' => '亚马逊物流移除订单详情报告',
                'value' => '_GET_FBA_FULFILLMENT_REMOVAL_ORDER_DETAIL_DATA_',
            ],
            [
                'name' => '亚马逊物流移除货件详情报告',
                'value' => '_GET_FBA_FULFILLMENT_REMOVAL_SHIPMENT_DETAIL_DATA_',
            ],
        ];
    }

    public static function all()
    {
        return array_merge(
            self::getInventoryType(),
            self::getOrderTrackingType(),
            self::getOrderType(),
            self::getPendingOrderType(),
            self::getFulfillmentFbaType()
        );
    }
}