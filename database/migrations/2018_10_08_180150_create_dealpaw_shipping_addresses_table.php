<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateDealpawShippingAddressesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('dealpaw_shipping_addresses', function (Blueprint $table) {
            $table->increments('id');
            $table->unsignedInteger('dealpaw_address_id');
            $table->string('first_name', 30)->default('');
            $table->string('last_name', 30);
//            $table->string('full_name');
            $table->string('phone_number', 30)->nullable();
            $table->string('postcode', 30)->nullable();
            $table->string('country_code', 30)->comment('国家编码');
            $table->string('province_code', 30)->nullable()->comment('省/州 编码');
            $table->string('province_name');
            $table->string('city')->comment('城市');
            $table->string('street')->comment('详细地址');
            $table->unsignedInteger('user_id')->nullable()->comment('当user_id存在时则为地址簿地址,否则为订单冗余地址');
            $table->boolean('defaulted')->default(0);
            $table->timestamps();

            $table->index('dealpaw_address_id');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('dealpaw_shipping_addresses');
    }
}
