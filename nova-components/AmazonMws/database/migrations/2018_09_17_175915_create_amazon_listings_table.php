<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateAmazonListingsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('amazon_listings', function (Blueprint $table) {
            $table->increments('id');
            $table->string('sku');
            $table->string('asin')->nullable();
            $table->string('price')->nullable();
            $table->integer('quantity')->default(0)->comment('自发货库存');
            $table->string('business_price')->nullable();
            $table->json('business_options')->nullable();


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
            $table->unsignedInteger('amazon_id');
            $table->unsignedInteger('original_variant_id')->nullable();
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
        Schema::dropIfExists('amazon_listings');
    }
}
