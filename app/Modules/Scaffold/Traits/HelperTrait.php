<?php
/**
 * Created by PhpStorm.
 * User: z
 * Date: 2018/9/4
 * Time: 下午5:05
 */

namespace App\Modules\Scaffold\Traits;


use Illuminate\Support\Collection;

trait HelperTrait
{
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
    public function findAddAttributes($attributes, $key = 'id'): Collection
    {
        $attributes = $this->takeCollect($attributes);
        return $attributes->reduce(function ($res, $attribute) use ($key) {
            if ( !array_key_exists($key, $attribute) || is_null($attribute[$key])) {
                /** @var Collection $res */
                $res->push($attribute);
            };
            return $res;
        }, new Collection());
    }
}