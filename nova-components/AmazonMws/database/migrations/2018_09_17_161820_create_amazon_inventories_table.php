<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateAmazonInventoriesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('amazon_inventories', function (Blueprint $table) {
            $table->increments('id');
            $table->string('seller_sku')->comment('商品的卖家 SKU');
            $table->string('asin')->comment('商品的亚马逊标准识别号 (ASIN)');
            $table->string('fnsku');
            $table->integer('in_stock_supply_quantity')->default(0)->comment('当前位于的商品数量。此处不 包括当前在入库 货件中的商品数量，也不包括在亚马逊物流的亚马逊配送中心之间转移的商品数量');
            $table->string('condition')->comment('商品的状况');
            $table->integer('total_supply_quantity')->comment('亚马逊物流供应链中的商品总量。此处 包括当前位于亚马逊配送中心的商品数量、 当前在入库货件中的商品数量 以及在亚马逊物流的亚马逊配送中心之间 转移的商品数量');
            $table->json('earliest_availability')->nullable()->comment('您的库存可供应取货的最早日期');
            $table->json('supply_detail')->nullable()->comment('结构列表为选填项，列表中 指明了在亚马逊物流供应链 中某种特定商品的库存 当前所在的位置');
            $table->unsignedInteger('amazon_id');
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
        Schema::dropIfExists('amazon_inventories');
    }
}
