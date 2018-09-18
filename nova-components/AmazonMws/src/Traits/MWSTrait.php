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

trait MWSTrait
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

    public function getMatchingProductForId($idList = null)
    {
        if ( !$idList) {
            $res = $this->inventories()->pluck('sku')->chunk(5)->reduce(function ($res, $sku) {
                $result = array_get($this->_getMatchingProductForId($this->setIdListParams($sku)),
                    'GetMatchingProductForIdResponse.GetMatchingProductForIdResult');
                foreach ($result as $value) {
                    array_push($res, $value);
                }
                return $res;
            }, []);
            return $this->_getMatchingProductForIdResultToArray($res);
        }
    }

    private function _getMatchingProductForId($idList)
    {
        $params = array_merge(
            $idList,
            [
                'IdType' => 'SellerSKU',
                'MarketplaceId' => 'ATVPDKIKX0DER',
            ]
        );
        return $this->runMWS()->action(GetMatchingProductForId::make($params))->toArray();
    }

    private function _getMatchingProductForIdResultToArray(array $data)
    {
        return collect($data)->map(function ($product) {
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

    private function setIdListParams($idList = null)
    {
        if ($idList instanceof Collection) {
            static $num = 0;
            return $idList->mapWithKeys(function ($id) use (&$num) {
                $num++;
                return ['IdList.Id.' . $num => $id];
            })->tap(function ($collect) use (&$num) {
                $num = 0;
            })->toArray();
        }
        if (is_array($idList)) {
            static $num = 0;
            return collect($idList)->mapWithKeys(function ($id) use ($num) {
                $num++;
                return ['IdList.Id.' . $num => $id];
            })->tap(function () use (&$num) {
                $num = 0;
            })->toArray();
        }
        if (is_string($idList)) {
            return ['IdList.Id.1' => $idList];
        }
        return false;
    }
}