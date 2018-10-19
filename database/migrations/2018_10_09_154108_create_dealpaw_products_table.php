<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateDealpawProductsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('dealpaw_products', function (Blueprint $table) {
            $table->increments('id');
            $table->string('code');
            $table->string('name');
            $table->string('image')->nullable();
            $table->double('width')->comment('单位厘米');
            $table->double('height')->comment('单位厘米');
            $table->double('depth')->comment('单位厘米');
            $table->double('weight')->comment('单位 kg');
            $table->unsignedInteger('stock')->default(0)->comment('库存');
            $table->unsignedInteger('sold')->default(0)->comment('售出的数量');
            $table->json('option_values')->nullable();
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
        Schema::dropIfExists('dealpaw_products');
    }
}
