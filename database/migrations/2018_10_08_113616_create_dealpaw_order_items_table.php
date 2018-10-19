<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateDealpawOrderItemsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('dealpaw_order_items', function (Blueprint $table) {
            $table->increments('id');
            $table->unsignedInteger('order_id');
            $table->string('variant_code', 255);
            $table->unsignedInteger('quantity');
            $table->integer('total')->default(0)->comment('units_total + adjustments_total');


            // TODO 考虑使用json来进行冗余
            $table->string('product_code')->nullable();
            $table->string('product_name')->nullable()->comment('产品名称/冗余字段');
            $table->json('option_values')->nullable()->comment('冗余销售属性');
            $table->string('image')->nullable()->comment('图片/变体图片/冗余字段');

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
        Schema::dropIfExists('dealpaw_order_items');
    }
}
