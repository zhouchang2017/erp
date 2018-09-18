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
            $table->string('sku');
            $table->string('asin');
            $table->string('price');
            $table->integer('quantity');
            $table->string('business_price');
            $table->json('business_price_options');
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
