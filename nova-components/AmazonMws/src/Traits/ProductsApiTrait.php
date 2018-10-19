<?php
/**
 * Created by PhpStorm.
 * User: z
 * Date: 2018/9/18
 * Time: 2:20 PM
 */

namespace Chang\AmazonMws\Traits;


use Chang\AmazonMws\Actions\Products\GetMatchingProductForId;
use Illuminate\Support\Collection;

trait ProductsApiTrait
{
    public function toSnakeCase($data, $str = null)
    {
        if ( !$data instanceof Collection) {
            $data = collect($data);
        }
        return $data->mapWithKeys(function ($attr, $key) use ($str) {
            $arr = explode(':', $key);
            $key = snake_case(end($arr));
            return [$key => is_null($str) ? $attr : array_get($attr, $str)];
        })->toArray();
    }

    protected function getMatchingProductForIdResultToArray($data)
    {
        if ( !$data instanceof Collection) {
            $data = collect($data);
        }
        return $data->map(function ($product) {
            $product = $product->toArray();
            $sku = array_get($product, 'attributes');
            $item = array_get($product, 'Products.Product');
            $attributes = array_get($item, 'AttributeSets.ns2:ItemAttributes');
            $attributes['Avatar'] = array_get($attributes, 'ns2:SmallImage.ns2:URL');
            $params['sku'] = array_get($sku, 'Id');
            $params['marketplace_id'] = array_get($item, 'Identifiers.MarketplaceASIN.MarketplaceId.value');
            $params['asin'] = array_get($item, 'Identifiers.MarketplaceASIN.ASIN.value');
            $field = [
                'ns2:Binding',
                'ns2:Brand',
                'ns2:Color',
                'ns2:PartNumber',
                'ns2:ProductGroup',
                'ns2:ProductTypeName',
                'Avatar',
                'ns2:Title',
            ];
            $attributeField = $this->toSnakeCase(array_only($attributes, $field), 'value');

            unset($attributes['Avatar']);
            return array_merge($params, $attributeField, [
                'props' => $this->toSnakeCase(array_except($attributes, $field)),
                'variation_parent' => array_get($item, 'Relationships.VariationParent.Identifiers.MarketplaceASIN'),
                'sales_rank' => array_get($item, 'SalesRankings.SalesRank'),
            ]);
        });
    }

    protected function getMatchingProductForIdResultToCollection($data){
        if ( !$data instanceof Collection) {
            $data = collect($data);
        }
        return $data->map(function ($product) {
            $product = $product->toArray();
            $sku = array_get($product, 'attributes');
            $item = array_get($product, 'Products.Product');
            $attributes = array_get($item, 'AttributeSets.ns2:ItemAttributes');
            $attributes['Avatar'] = array_get($attributes, 'ns2:SmallImage.ns2:URL');
            $params['sku'] = array_get($sku, 'Id');
            $params['marketplace_id'] = array_get($item, 'Identifiers.MarketplaceASIN.MarketplaceId.value');
            $params['asin'] = array_get($item, 'Identifiers.MarketplaceASIN.ASIN.value');
            $field = [
                'ns2:Binding',
                'ns2:Brand',
                'ns2:Color',
                'ns2:PartNumber',
                'ns2:ProductGroup',
                'ns2:ProductTypeName',
                'Avatar',
                'ns2:Title',
            ];
            $attributeField = $this->toSnakeCase(array_only($attributes, $field), 'value');

            unset($attributes['Avatar']);
            return array_merge($params, $attributeField, [
                'props' => $this->toSnakeCase(array_except($attributes, $field)),
                'variation_parent' => array_get($item, 'Relationships.VariationParent.Identifiers.MarketplaceASIN'),
                'sales_rank' => array_get($item, 'SalesRankings.SalesRank'),
            ]);
        });
    }

}