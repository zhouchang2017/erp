<?php

namespace Chang\BelongsToManyAttribute;

use Illuminate\Database\Eloquent\Model;
use Laravel\Nova\Fields\Field;
use App;
use Laravel\Nova\Http\Requests\NovaRequest;

class BelongsToManyAttribute extends Field
{
    /**
     * The field's component.
     *
     * @var string
     */
    public $component = 'belongs-to-many-attribute';

    protected $relationModel;

    protected $locales;

    public function __construct(string $name, ?string $attribute = null, ?mixed $resolveCallback = null)
    {
        parent::__construct($name, $attribute, $resolveCallback);

        $this->locales = array_map(function ($value) {
            return __($value);
        }, config('translatable.locales'));

        $this->withMeta([
            'locales' => $this->locales,
            'indexLocale' => app()->getLocale(),
        ]);
    }

    /**
     * Set the locales to display / edit.
     *
     * @param  array $locales
     * @return $this
     */
    public function locales(array $locales)
    {
        return $this->withMeta(['locales' => $locales]);
    }

    /**
     * Set the locale to display on index.
     *
     * @param  string $locale
     * @return $this
     */
    public function indexLocale($locale)
    {
        return $this->withMeta(['indexLocale' => $locale]);
    }

    /**
     * Set the input field to a single line text field.
     */
    public function singleLine()
    {
        return $this->withMeta(['singleLine' => true]);
    }

    /**
     * @param mixed $relationModel
     */
    public function setRelationModel($relationModel): void
    {
        $this->relationModel = $relationModel;
    }

    // App::getLocale()

    protected function resolveAttribute($resource, $attribute)
    {
        $value = $resource->attributeValuesTranslation;
        $this->withMeta(['attributes' => App\Modules\DealpawProduct\Models\ProductAttribute::withTranslation()->get()]);
        return $value;
    }

    protected function fillAttributeFromRequest(NovaRequest $request, $requestAttribute, $model, $attribute)
    {
        if ($request->exists($requestAttribute)) {
            $ids = [];
            $data = $this->handleRequest($request[$requestAttribute], $model, $ids);

            $class = get_class($model);
            $class::saved(function ($model) use ($data, $ids) {
                $this->removeDeletedAttributes($ids, $model);
                $this->addNewAttributes($data, $model);
            });
        }
    }

    protected function handleRequest($data, $model, &$ids = [])
    {
        return collect($data)->map(function ($item) use ($model, &$ids) {
            return collect(array_keys($item['value']))->map(function ($locale) use ($item, $model, &$ids) {
                $id = array_get($item, 'related.' . $locale . '.id');
                if ( !is_null($id)) {
                    array_push($ids, $id);
                }
                $attributeId = array_get($item, 'origin.id');
                $textValue = array_get($item, 'value.' . $locale);
                return [
                    $locale => [
                        "id" => $id,
                        "product_id" => $model->id,
                        "attribute_id" => $attributeId,
                        "locale_code" => $locale,
                        "text_value" => $textValue,
                    ],
                ];
            });
        });
    }


    protected function removeDeletedAttributes($ids, $model)
    {
        $model->attributeValues->pluck('id')->diff($ids)
            ->each(function ($id) use ($model) {
                $model->attributeValues()->whereId($id)->firstOrFail()->delete();
            });
    }

    protected function addNewAttributes($data, $model)
    {
        $data->flatten(2)->each(function ($attribute) use ($model) {
            $model->attributeValues()->updateOrCreate(['id' => $attribute['id']], $attribute);
        });
    }

}
