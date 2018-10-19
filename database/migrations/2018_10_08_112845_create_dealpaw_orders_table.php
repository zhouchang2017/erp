<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateDealpawOrdersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('dealpaw_orders', function (Blueprint $table) {
            $table->increments('id');
            $table->string('number')->nullable()->comment('order number');
            $table->unsignedInteger('address_id')->nullable();
            $table->unsignedInteger('channel_id');
            $table->unsignedInteger('user_id');
            $table->integer('total')->default(0)->comment('需支付金额 unit/分');
            $table->string('currency_code')->comment('货币编号');
            $table->string('state')->comment('new, cancelled, fulfilled');
            $table->string('payment_state');
            $table->string('shipping_state');

            $table->ipAddress('user_ip')->comment('购买用户ip');

            $table->string('payment_method_name')->nullable()->comment('confirm后冗余');
            $table->string('coupon_name')->nullable()->comment('confirm后冗余');

            $table->timestamp('paid_at')->nullable()->comment('支付时间');
            $table->timestamp('confirmed_at')->nullable()->comment('确认订单时间');
            $table->timestamp('reviewed_at')->nullable();
            $table->timestamp('fulfilled_at')->nullable();

            $table->unsignedInteger('dealpaw_id');
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
        Schema::dropIfExists('dealpaw_orders');
    }
}
