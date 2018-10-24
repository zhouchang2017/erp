<?php
/**
 * Created by PhpStorm.
 * User: z
 * Date: 2018/10/8
 * Time: 11:51 AM
 */

namespace App\Modules\Order\Services;


use App\Modules\Channel\Dealpaw\Models\Dealpaw;
use App\Modules\Channel\Dealpaw\Models\DealpawOrder;
use App\Modules\Channel\Dealpaw\Services\DealpawService;
use App\Modules\Order\Contracts\OrderContract;
use App\Modules\Order\Models\Order;
use DB;
use Log;

class OrderServer
{
    protected $order;

    protected $debug;

    /**
     * OrderServer constructor.
     * @param $order
     */
    public function __construct(Order $order)
    {
        $this->order = $order;
        $this->debug = config('app.debug');
    }

    public function createForDealpaw(array $attributes)
    {
        try {
            DB::beginTransaction();

            // channel_code
            $code = array_get($attributes, 'channel.code');
            /** @var Dealpaw $dealpaw */
            $dealpaw = Dealpaw::whereCode($code)->first();
            if ($dealpaw->count() > 0) {
                $order = $dealpaw->orders()->updateOrCreate(['number' => $attributes['number']], $attributes);

                $this->createAddress($order, $attributes);

                $order->items()->createMany($attributes['items']);

                $order->morphOrder()->create($order->toMorphArray());

                DB::commit();
                return $order;

            } else {
                DB::rollBack();
                throw new \Exception('code => ' . $code . '尚未在本系统注册');
            }

        } catch (\Exception $exception) {
            Log::error('创建订单失败' . $exception->getMessage());
            return $exception->getMessage();
        }
    }

    public function
    updateForDealpaw($number, array $attribute)
    {
        $dealpawOrder = $this->getDealpawOrderByNumber($number);
        $this->createAddress($dealpawOrder, $attribute);

        // has shipment
        $shipment = array_get($attribute, 'shipment.tracking_number', false);
        if ($shipment) {
            (new DealpawService($dealpawOrder->dealpaw))->shipment($dealpawOrder, $shipment, false);
        }
        return $dealpawOrder->update(array_only($attribute, DealpawOrder::$updateFillable));
    }

    public function getDealpawOrderByNumber($number)
    {
        return DealpawOrder::whereNumber($number)->firstOrFail();
    }

    private function createAddress($order, array $attribute)
    {
        if (array_key_exists('address', $attribute)) {
            $address = array_get($attribute, 'address');
            $address['dealpaw_address_id'] = $address['id'];
            unset($address['id']);
            $order->address()->updateOrCreate([
                'dealpaw_address_id' => $address['dealpaw_address_id'],
            ], $address);
        }
    }

    public function createForAmazon(OrderContract $order)
    {
        return $order->morphOrder()->updateOrCreate(
            ['orderable_type' => get_class($order), 'orderable_id' => $order->id],
            $order->toMorphArray()
        );
    }

    /**
     * @param array $attributes
     * @param OrderContract $model
     * @return OrderContract
     */
    private function createOrderTypeModel(array $attributes, OrderContract $model)
    {
        return $model::create($attributes);
    }
}