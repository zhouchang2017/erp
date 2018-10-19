<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateAmazonOrderItemsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('amazon_order_items', function (Blueprint $table) {
            $table->increments('id');
            $table->string('asin');
            $table->string('seller_sku');
            $table->string('order_item_id');
            $table->string('title');
            $table->string('quantity_ordered');
            $table->integer('quantity_shipped');
            $table->json('item_price')->nullable()->comment('订单商品的售价');
            $table->json('shipping_price')->nullable()->comment('运费');
            $table->json('gift_wrap_price')->nullable()->comment('商品的礼品包装金额');
            $table->json('item_tax')->nullable()->comment('商品价格的税费');
            $table->json('shipping_tax')->nullable()->comment('运费的税费');
            $table->json('gift_wrap_tax')->nullable()->comment('礼品包装金额的税费');
            $table->json('shipping_discount')->nullable()->comment('运费的折扣');
            $table->json('promotion_discount')->nullable()->comment('报价中的全部促销折扣总计');

            $table->string('promotion_ids')->nullable();
            $table->json('cod_fee')->nullable()->comment('COD 服务费用');
            $table->json('cod_fee_discount')->nullable()->comment('货到付款费用的折扣');

            $table->string('gift_message_text')->nullable()->comment('买家提供的礼品消息');
            $table->string('gift_wrap_level')->nullable()->comment('买家指定的礼品包装等级');
            $table->string('condition_note')->nullable()->comment('卖家描述的商品状况');

            $table->string('condition_id')->nullable()->comment('商品的状况');
            $table->string('condition_subtype_id')->nullable()->comment('商品的子状况');
            $table->string('amazon_order_id');
            $table->unsignedInteger('order_id');
            $table->timestamp('scheduled_delivery_start_date')->nullable()->comment('订单预约送货上门的开始日期（目的地时区）');
            $table->timestamp('scheduled_delivery_end_date')->nullable()->comment('订单预约送货上门的终止日期（目的地时区）');
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
        Schema::dropIfExists('amazon_order_items');
    }
}
