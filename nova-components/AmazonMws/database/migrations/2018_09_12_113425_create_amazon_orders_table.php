<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateAmazonOrdersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('amazon_orders', function (Blueprint $table) {
            $table->increments('id');
            $table->string('amazon_order_id');
            $table->string('seller_order_id')->nullable();
            $table->timestamp('purchase_date');
            $table->timestamp('last_update_date');
            $table->string('order_status');
            $table->string('fulfillment_channel')->nullable();
            $table->string('sales_channel')->nullable();
            $table->string('order_channel')->nullable();
            $table->string('ship_service_level')->nullable();
            $table->unsignedInteger('shipping_address_id')->nullable()->comment('ShippingAddress');
            $table->json('order_total')->nullable()->comment('OrderTotal');
            $table->integer('number_of_items_shipped')->default(0)->comment('已配送的商品数量');
            $table->integer('number_of_items_unshipped')->default(0)->comment('未配送的商品数量');
            $table->json('payment_execution_detail')->nullable()->default(null)->comment('仅对 COD 订单返回。仅适用于中国 (CN) 和日本 (JP)');
            $table->string('payment_method')->nullable();
            $table->string('marketplace_id');
            $table->string('buyer_email')->nullable();
            $table->string('buyer_name')->nullable();
            $table->string('shipment_service_level_category')->nullable();
            $table->string('cba_displayable_shipping_label')->nullable()->comment('卖家自定义的配送方式');
            $table->string('order_type')->comment('订单类型,Preorder 仅在日本 (JP) 是可行的OrderType 值');
            $table->timestamp('earliest_ship_date')->nullable()->comment('您承诺的订单发货时间范围的第一天。日期格式为 ISO 8601');
            $table->timestamp('latest_ship_date')->nullable()->comment('您承诺的订单发货时间范围的最后一天。日期格式为 ISO 8601');
            $table->timestamp('earliest_delivery_date')->nullable()->comment('您承诺的订单送达时间范围的第一天。日期格式为 ISO 8601');
            $table->timestamp('latest_delivery_date')->nullable()->comment('您承诺的订单送达时间范围的最后一天。日期格式为 ISO 8601');
            $table->unsignedInteger('amazon_id')->comment('对应本地注册的亚马逊店铺');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('amazon_orders');
    }
}
