<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateAmazonProductsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('amazon_products', function (Blueprint $table) {
            $table->increments('id');
            $table->string('sku');
            $table->string('asin')->nullable();
            $table->string('marketplace_id')->nullable();
            $table->string('binding')->nullable();
            $table->string('brand')->nullable();
            $table->string('color')->nullable();

            $table->string('avatar')->nullable();
            $table->string('title')->nullable();

            $table->string('part_number')->nullable();
            $table->string('product_group')->nullable();
            $table->string('product_type_name')->nullable();

            $table->json('variation_parent')->nullable();

            $table->json('props')->nullable();
            $table->json('sales_rank')->nullable()->comment('销售排行');
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
        Schema::dropIfExists('amazon_products');
    }
}
