<?php

namespace Chang\BelongsToManyOption;

use App\Modules\DealpawProduct\Models\ProductOption;
use Laravel\Nova\Fields\Field;

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
        $value = $resource->options;
        $this->withMeta(['options' => ProductOption::with('values')->get()]);
        return $value;
    }
}
