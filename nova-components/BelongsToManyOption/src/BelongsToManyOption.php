<?php

namespace Chang\BelongsToManyOption;

use App\Modules\DealpawProduct\Models\Product;
use App\Modules\DealpawProduct\Models\ProductOption;
use App\Modules\DealpawProduct\Models\ProductVariant;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Collection;
use Laravel\Nova\Fields\Field;
use Laravel\Nova\Http\Requests\NovaRequest;

class BelongsToManyOption extends Field
{
    /**
     * The field's component.
     *
     * @var string
     */
    public $component = 'belongs-to-many-option';

    protected function resolveAttribute($resource, $attribute)
    {
        $value = $resource->options->load('values');
        $this->withMeta(['options' => ProductOption::with('values')->get()]);
        $this->withMeta([
            'origin' => $resource->with(['variants.optionValues', 'variants.price'])->where('id',
                $resource->id)->first(),
        ]);
        return $value;
    }

    protected function fillAttributeFromRequest(NovaRequest $request, $requestAttribute, $model, $attribute)
    {
        if ($request->exists($requestAttribute)) {
            $data = collect(json_decode($request[$requestAttribute], true));
            $remainingIds = $this->getVariantIds($data);
            $class = get_class($model);
            $class::saved(function ($model) use ($data, $remainingIds) {
                $this->syncProductOptions($model, $data);
                $this->removeDeletedVariants($remainingIds, $model);
                $this->updateOrCreateVariants($data, $model);
            });
        }
    }

    protected function syncProductOptions($model, $data)
    {
        $optionIds = $data->pluck('options')->flatten(1)->pluck('option_id')->unique()->values()->all();
        $model->options()->sync($optionIds);
    }

    protected function getVariantIds(Collection $data)
    {
        return $data->filter(function ($variant) {
            return !is_null($variant['id']);
        })->pluck('id');
    }

    private function updateOrCreateVariants($data, $model)
    {
        $data->each(function ($attribute) use ($model) {

            $variant = $model->variants()->updateOrCreate([
                'id' => $attribute['id'],
            ], array_only($attribute, ['id', 'code', 'height', 'length', 'width', 'weight']));

            $this->syncVariantOptionValues($variant, $attribute['options']);

            $this->updateOrCreateVariantPrice($variant, array_get($attribute, 'price', 0));
        });
    }

    protected function updateOrCreateVariantPrice(ProductVariant $variant, $price)
    {
        if ($variant->hasPrice()) {
            $variantPrice = $variant->price;
            $variantPrice->price = $price;
            $variantPrice->save();
            return;
        }
        $variant->price()->create(['price' => $price]);
    }

    protected function syncVariantOptionValues(ProductVariant $variant, array $options)
    {
        $variant->optionValues()->sync($this->getOptionsIds($options));
    }

    protected function getOptionsIds(array $options)
    {
        return array_map(function ($option) {
            return $option['id'];
        }, $options);
    }

    private function removeDeletedVariants($remainingIds, Model $product)
    {
        $variants = $product->variants;

        $variants->pluck('id')->diff($remainingIds)->each(function ($id) {
            if ($variant = ProductVariant::where('id', $id)->first()) {
                $variant->delete();
            }
        });

        return $remainingIds;
    }
}
