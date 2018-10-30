<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateWarehouseTables extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('warehouse_types', function (Blueprint $table) {
            $table->increments('id');
            $table->string('name')->comment('仓库类型名称');
            $table->text('description')->nullable()->comment('简介');
            $table->boolean('enabled')->default(true)->comment('是否启用');
            $table->timestamps();
        });

        Schema::create('warehouses', function (Blueprint $table) {
            $table->increments('id');
            $table->string('name')->comment('仓库名称');
            $table->unsignedInteger('type_id')->comment('仓库类型');
            $table->timestamps();
        });

        Schema::create('storages', function (Blueprint $table) {
            $table->increments('id');
            $table->unsignedInteger('warehouse_id')->comment('仓库id');
            $table->unsignedInteger('product_id')->comment('商品id');
            $table->unsignedInteger('product_variant_id')->comment('变体id');
            $table->integer('num')->default(0)->comment('总数量');
            $table->integer('good')->default(0)->comment('良品数量');
            $table->integer('bad')->default(0)->comment('破损数量');
            $table->timestamps();

        });

        Schema::create('storage_histories', function (Blueprint $table) {
            $table->increments('id');
            $table->unsignedInteger('warehouse_id')->comment('仓库id');
            $table->morphs('origin');
            $table->unsignedInteger('product_id')->comment('产品id');
            $table->unsignedInteger('product_variant_id')->comment('变体id');
            $table->integer('good')->default(0)->comment('入库良品数量');
            $table->integer('bad')->default(0)->comment('入库不良品数量');
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
        Schema::dropIfExists('warehouse_types');

        Schema::dropIfExists('warehouses');

        Schema::dropIfExists('storages');

        Schema::dropIfExists('storage_histories');

    }
}
