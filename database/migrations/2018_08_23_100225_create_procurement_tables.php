<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateProcurementTables extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        // 采购计划
        Schema::create('procurement_plans', function (Blueprint $table) {
            $table->increments('id');
            $table->string('code')->unique()->comment('采购编号');
            $table->unsignedInteger('warehouse_id')->comment('采购仓库');
            $table->unsignedInteger('user_id')->comment('采购单创建人');
            $table->text('description')->nullable()->comment('采购计划说明');
            $table->json('comment')->nullable()->comment('采购计划备注');
            $table->json('history')->nullabel()->comment('审核记录');
            $table->enum('status',['uncommitted','pending','return','cancel','already'])->comment('采购计划状态');
            $table->softDeletes();
            $table->timestamps();


            $table->foreign('warehouse_id')
                ->references('id')
                ->on('warehouses')
                ->onDelete('cascade');

            $table->foreign('user_id')->references('id')->on('users');
        });

        // 采购产品
        Schema::create('procurement_plan_product_variant', function (Blueprint $table) {
            $table->increments('id');
            $table->unsignedInteger('procurement_plan_id');
            $table->unsignedInteger('product_id')->nullable();
            $table->unsignedInteger('product_variant_id')->nullable();
            $table->integer('price')->unsigned()->default(0)->comment('采购单价');
            $table->integer('pcs')->unsigned()->default(0)->comment('采购数量');
            $table->integer('arrived_pcs')->unsigned()->default(0)->comment('以收到数量');
            $table->integer('offer_price')->unsigned()->default(0)->comment('供应商当时报价');
            $table->unsignedInteger('product_provider_id')->nullable()->comment('供应商id');
            $table->unsignedInteger('user_id')->nullable()->comment('采购员id');
            $table->integer('good')->default(0)->comment('良品数量');
            $table->integer('bad')->default(0)->comment('不良品数量');
            $table->integer('lost')->default(0)->comment('丢失数量');
            $table->timestamps();

            $table->foreign('procurement_plan_id','procurement_plan_variant_plan_id')
                ->references('id')
                ->on('procurement_plans')
                ->onDelete('cascade');

            $table->foreign('product_id','procurement_plan_variant_product_id')
                ->references('id')
                ->on('products')
                ->onDelete('cascade');

            $table->foreign('product_variant_id','procurement_plan_variant_variant_id')
                ->references('id')
                ->on('product_variants')
                ->onDelete('cascade');

            $table->foreign('product_provider_id','procurement_plan_variant_provider_id')->references('id')->on('product_providers');

            $table->foreign('user_id','procurement_plan_variant_user_id')->references('id')->on('users');

//            $table->primary(['procurement_plan_id', 'product_variant_id'],'plan_product_variant');
        });



        // 采购
        Schema::create('procurements', function (Blueprint $table) {
            $table->increments('id');
            $table->unsignedInteger('procurement_plan_id')->comment('采购计划id');
            $table->integer('total_price')->unsigned()->default(0)->comment('采购总价');
            $table->integer('total_pcs')->unsigned()->default(0)->comment('采购总数量');
            $table->integer('able_price')->unsigned()->default(0)->comment('应付款');
            $table->integer('already_price')->unsigned()->default(0)->comment('已付款');
            $table->enum('procurement_status', [ 'part_finished', 'pending', 'sending', 'finished', 'cancel' ])->comment('采购状态');
            $table->enum('payment_status', [ 'unpaid', 'paid', 'part_paid', 'cancel' ])->comment('付款状态');
            $table->timestamp('procurement_at')->nullable()->comment('采购日期');
            $table->timestamp('arrived_at')->nullable()->comment('到货日期');
            $table->timestamp('pre_arrived_at')->nullable()->comment('预计到货日期');
            $table->json('shipment')->nullable()->comment('物流信息');
            $table->softDeletes();
            $table->timestamps();

            $table->foreign('procurement_plan_id')
                ->references('id')
                ->on('procurement_plans')
                ->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('procurement_plans');

        Schema::dropIfExists('procurement_plan_product_variant');

        Schema::dropIfExists('procurements');
    }
}
