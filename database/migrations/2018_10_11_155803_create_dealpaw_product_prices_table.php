<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateDealpawProductPricesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('dealpaw_product_prices', function (Blueprint $table) {
            $table->increments('id');
            $table->unsignedInteger('dealpaw_id');
            $table->unsignedInteger('dealpaw_product_id');
            $table->unsignedInteger('original_price')->comment('原价 单位/分');
            $table->unsignedInteger('price')->comment('销售价格 单位/分');
            $table->unsignedInteger('deal_price')->nullable();
            $table->timestamps();

            $table->index('dealpaw_id');
            $table->index('dealpaw_product_id');

            $table->unique(['dealpaw_id', 'dealpaw_product_id']);
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('dealpaw_product_prices');
    }
}
