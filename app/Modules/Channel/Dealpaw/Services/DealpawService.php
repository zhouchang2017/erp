<?php
/**
 * Created by PhpStorm.
 * User: z
 * Date: 2018/10/9
 * Time: 3:50 PM
 */

namespace App\Modules\Channel\Dealpaw\Services;

use App\Modules\Channel\Dealpaw\Models\Dealpaw;
use App\Modules\Channel\Dealpaw\Models\DealpawOrder;
use App\Modules\Channel\Dealpaw\Models\DealpawOrderItem;
use App\Modules\Channel\Dealpaw\Models\DealpawProduct;
use App\Modules\Channel\Dealpaw\Models\DealpawProductPrice;
use App\Modules\Channel\Dealpaw\Models\DealpawShippingAddress;

class DealpawService
{
    protected $client;

    protected $dealpaw;

    /**
     * DealpawService constructor.
     * @param Dealpaw $dealpaw
     */
    public function __construct(Dealpaw $dealpaw)
    {
        $this->dealpaw = $dealpaw;
        $this->client = $this->dealpaw->runClient();
    }

    /**
     * 同步dealpaw所有频道
     */
    public function syncChannels()
    {
        $this->client->setUri('channels');
        $res = $this->client->fetch();
        $data = $res['data'];

        tap(collect($data), function ($channels) {
            $channels->each(function ($channel) {
                $channel['original_id'] = $channel['id'];
                $channel['api_url'] = config('dealpaw.base_uri');
                $channel['api_prefix'] = config('dealpaw.prefix');
                $channel['header'] = config('dealpaw.header');
                Dealpaw::updateOrCreate(['code' => $channel['code']], $channel);
            });
        });
    }

    /**
     * @param int $page
     * 同步dealpaw系统所有产品
     */
    public function syncProducts($page = 1)
    {
        $this->client->setUri('products');
        $this->client->setParams([
            'include' => "variants.option_values,variants.prices,image,channels",
            'page' => $page,
        ]);
        $res = $this->client->fetch();

        $data = $res['data'];

        if (count($data) > 0) {
            collect($data)->each(function ($product) {
                $variants = array_get($product, 'variants.data');

                $inChannel = collect(array_get($product, 'channels.data'))
                        ->where('code', $this->dealpaw->code)
                        ->count() > 0;

                if ($variants) {
                    collect($variants)->each(function ($variant) use ($product, $inChannel) {
                        $variant['image'] = array_get($product, 'image.data.image');
                        $variant['option_values'] = array_get($variant, 'option_values.data');
                        $variant['name'] = $product['name'];
                        /*
                         * update or create product
                         * */

                        $dealpawVariant = DealpawProduct::updateOrCreate(
                            ['code' => $variant['code']], $variant
                        );


                        $price = array_where(array_get($variant, 'prices.data'), function ($value, $key) {
                            return $value['channel_id'] === $this->dealpaw->original_id;
                        });
                        if (count($price) > 0) {
                            $price = $price[0];
                            $price['dealpaw_id'] = $this->dealpaw->id;
                            $dealpawVariant->prices()->updateOrCreate(
                                [
                                    'dealpaw_id' => $this->dealpaw->id,
                                    'dealpaw_product_id' => $dealpawVariant->id,
                                ],
                                $price
                            );
                        }


                        $hasAttached = ! !$this->dealpaw->products()->whereId($dealpawVariant->id)->count();
                        if ($inChannel) {
                            !$hasAttached && $this->dealpaw->products()->attach($dealpawVariant->id);
                        } else {
                            $this->dealpaw->products()->detach($dealpawVariant->id);
                        }
                    });
                }
            });
        }

        $hasNext = ! !array_get($res, 'meta.pagination.links.next');
        if ($hasNext) {
            $this->syncProducts($page + 1);
        }
    }


    /**
     * @param $originalId
     * @return mixed
     * 通过dealpaw系统原始id获取本地对应的dealpaw_id
     */
    public function getDealpawId($originalId)
    {
        return Dealpaw::whereOriginalId($originalId)->first();
    }

    public function syncProductPriceToDealpaw(DealpawProductPrice $price)
    {
        $data = [
            'channel_code' => $price->dealpaw->code,
            'variant_code' => $price->product->code,
            'price' => $price->price,
            'original_price' => $price->original_price,
        ];

        $this->client->setUri('prices');
        $this->client->setMethod('PUT');
        $this->client->setParams($data);
        $this->client->fetch();
    }

    public function syncProductToDealpaw(DealpawProduct $product)
    {
        $data = [
            'width' => $product->width,
            'height' => $product->height,
            'length' => $product->depth, //
            'stock' => $product->stock,
            'weight' => $product->weight,
        ];

        $this->client->setUri('product_variants/' . $product->code);
        $this->client->setMethod('PUT');
        $this->client->setParams($data);
        $this->client->fetch();
    }

    public function syncAddressToDealpaw(DealpawShippingAddress $address)
    {
        $data = array_only($address->toArray(), DealpawShippingAddress::$updateFillable);
        $this->client->setUri('orders/' . $address->order->number . '/address');
        $this->client->setMethod('PUT');
        $this->client->setParams($data);
        $this->client->fetch();
    }

    private function syncShipmentToDealpaw(DealpawOrder $order, $number)
    {
        $this->client->setUri('orders/' . $order->number . '/ship');
        $this->client->setMethod('POST');
        $this->client->setParams([
            'tracking_number' => $number,
        ]);
        return $this->client->fetch();
    }

    public function shipment(DealpawOrder $order, $number, $isHttp = true)
    {
        $order->items()->each(function ($item) use ($order, $number, $isHttp) {
            if ($isHttp) {
                $response = array_get($this->syncShipmentToDealpaw($order, $number), 'data');
                \Log::info('response=>', $response);
                if ($response) {
                    $order->update(
                        array_only(
                            $response
                            , DealpawOrder::$updateFillable)
                    );
                }

            }
            /** @var DealpawOrderItem $item */
            $item->shipment()->updateOrCreate([
                'order_item_id' => $item->id,
                'order_id' => $order->id,
            ], [
                'tracking_number' => $number,
                'order_item_id' => $item->id,
                'order_id' => $order->id,
            ]);
        });
    }

}