<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateManuallyTables extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('manuallies', function (Blueprint $table) {
            $table->increments('id');
            $table->unsignedInteger('user_id')->comment('入库经办人');
            $table->unsignedInteger('warehouse_id')->comment('入库id');
            $table->text('description')->nullable()->comment('手工入库描述');
            $table->enum('status',['uncommitted','pending','finished','cancel']);
            $table->json('history')->default(null)->nullable()->comment('审核记录');
            $table->softDeletes();
            $table->timestamps();

            $table->foreign('user_id')->references('id')->on('users');

            $table->foreign('warehouse_id')
                ->references('id')
                ->on('warehouses')
                ->onDelete('cascade');

        });

        Schema::create('manually_product_variant', function (Blueprint $table) {
            $table->increments('id');
            $table->unsignedInteger('manually_id');
            $table->unsignedInteger('product_id');
            $table->unsignedInteger('product_variant_id');
            $table->integer('price')->unsigned()->default(0)->comment('采购单价');
            $table->integer('pcs')->unsigned()->default(0)->comment('采购数量');
            $table->integer('offer_price')->unsigned()->default(0)->comment('供应商当时报价');
            $table->unsignedInteger('product_provider_id')->nullable()->comment('供应商id');
            $table->unsignedInteger('user_id')->nullable()->comment('采购员id');
            $table->integer('good')->default(0)->comment('良品数量');
            $table->integer('bad')->default(0)->comment('不良品数量');
            $table->timestamps();

            $table->foreign('manually_id')
                ->references('id')
                ->on('manuallies')
                ->onDelete('cascade');

            $table->foreign('product_id')
                ->references('id')
                ->on('products')
                ->onDelete('cascade');

            $table->foreign('product_variant_id')
                ->references('id')
                ->on('product_variants')
                ->onDelete('cascade');

            $table->foreign('user_id')->references('id')->on('users');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('manuallies');

        Schema::dropIfExists('manually_product_variant');
    }
}
