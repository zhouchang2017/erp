<?php

namespace App\Modules\Product\Services;


use App\Modules\Product\Models\Product;
use App\Modules\Product\Models\ProductAttribute;
use App\Modules\Product\Models\ProductVariant;
use App\Modules\Scaffold\BaseService;
use Illuminate\Support\Collection;
use DB;
use Log;
use Spatie\QueryBuilder\QueryBuilder;

/**
 * Class ProductService
 * @package App\Modules\Product\Services
 */
class ProductService extends BaseService
{
    /**
     * @var Product
     */
    protected $product;

    protected $debug;

    protected $allowedInclude = [
        'type',
        'brand',
        'variants',
        'variants.providers',
        'attributes',
        'productAttributes',
        'categories',
        'providers',
    ];


    /**
     * ProductService constructor.
     * @param Product $product
     */
    public function __construct(Product $product)
    {

        $this->product = $product;

        $this->debug = config('app.debug');
    }


    /**
     * @param Product $product
     */
    public function setProduct(Product $product): void
    {
        $this->product = $product;
    }


    /**
     * 创建变体
     * @param array|Collection $attributes
     */
    private function createProductVariant($attributes)
    {
        $attributes->each(function ($attribute) {
            /**
             * @var ProductVariant $variantInstance
             * Create Product Variant
             */
            $variantInstance = $this->product->variants()->create(array_only($attribute,
                ['price', 'sku', 'attribute_key']));

            /*
             * Sync ProductVariant Relation as ProductAttribute
             * */
            $variantInstance->attributes()->sync(
                $this->findProductAttributePrimaryKeys(array_get($attribute, 'attributes'))
            );
        });
    }

    /**
     * 通过 attributes id 获取productAttribute表 主键
     * @param $keys
     * @param string $primaryKey
     * @return Collection
     */
    private function findProductAttributePrimaryKeys($keys, $primaryKey = 'id')
    {
        return $this->product->attributes()->whereIn('attribute_id', $keys)->pluck($primaryKey);
    }


    public function updateOrCreateAttributes($id, array $attributes)
    {
        try {
            DB::beginTransaction();
            /** @var Product $product */
            $product = $this->product::findOrFail($id);

            $this->setProduct($product);
//            $this->product->update($attributes);
            /*
             * Create Product Attribute
             * */
            request()->has('attributes')
            && $this->updateOrCreateProductAttribute(request()->input('attributes'));

            /*
             * Create Product Variants
             * */
            request()->has('variants')
            && $this->updateOrCreateVariant(request('variants'));

            DB::commit();
        } catch (\Exception $exception) {
            DB::rollBack();
            if ($this->debug) {
                dd($exception);
            }
            Log::error('创建产品失败');
        }
    }

    /**
     * 更新/创建属性
     * @param array $attributes
     * @return array|mixed
     */
    private function updateOrCreateProductAttribute(array $attributes)
    {
        $changes = $this->attributesMapWithKeys($attributes);
        /*
         * Update or delete ProductAttribute
         * */
        $this->product->attributes()->get()->each(function ($attribute) use ($changes) {
            /** @var ProductAttribute $attribute */
            is_null($changes->get($attribute->id)) ? $attribute->delete() : $attribute->update($changes->get($attribute->id));
        });

        /*
         * Create New ProductAttributes
         * */
        $this->product->attributes()->createMany($this->findAddAttributes($attributes)->toArray());
    }


    /**
     * @param array $attributes
     */
    private function updateOrCreateVariant(array $attributes)
    {
        // 1.有id    更新（库存，价格，info)
        $changes = $this->attributesMapWithKeys($attributes);
        $this->product->variants->each(function ($variant) use ($changes) {
            /** @var ProductVariant $variant */
            if (is_null($changes->get($variant->id))) {
                $variant->delete();
            } else {
                $updateAttribute = $changes->get($variant->id);

                $variant->update($updateAttribute);

                $variant->attributes()->sync(
                    $this->findProductAttributePrimaryKeys($updateAttribute['attributes'])
                );
            }
        });

        // 2.无id    创建
        $this->createProductVariant($this->findAddAttributes($attributes));
    }


    public function attributesMapWithKeys(iterable $attributes, $key = 'id'): Collection
    {
        $attributes = $this->takeCollect($attributes);
        // 过滤不存在$key的元素
        $attributes = $attributes->filter(function ($value) use ($key) {
            return array_key_exists($key, $value) && !is_null($value[$key]);
        });
        return $attributes->mapWithKeys(function ($item) use ($key) {
            return [$item[$key] => $item];
        });
    }

    /**
     * 转换集合
     * @param array $attributes
     * @return \Illuminate\Support\Collection
     */
    public function takeCollect($attributes): Collection
    {
        if ( !$attributes instanceof Collection) {
            return collect($attributes);
        }
        return $attributes;
    }

    /**
     * 过滤需要创建的新属性
     * @param array|Collection $attributes
     * @param string $key
     * @return Collection
     */
    private function findAddAttributes($attributes, $key = 'id'): Collection
    {
        $attributes = $this->takeCollect($attributes);
        return $attributes->reduce(function ($res, $attribute) use ($key) {
            if ( !array_key_exists('id', $attribute) || is_null($attribute['id'])) {
                $res->push($attribute);
            };
            return $res;
        }, new Collection());
    }

    public function query()
    {
        return QueryBuilder::for(Product::class)
            ->allowedIncludes($this->allowedInclude);
    }
}