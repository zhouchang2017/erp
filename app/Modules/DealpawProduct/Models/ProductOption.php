<?php

namespace App\Modules\DealpawProduct\Models;

use Dimsav\Translatable\Translatable;
use App\Modules\Scaffold\BaseModel as Model;

class ProductOption extends Model
{
    use Translatable;

    protected $connection = 'dealpaw';

    public $translationForeignKey = 'translatable_id';

    public $translationModel = ProductOptionTranslation::class;

    public $translatedAttributes = ['name'];

    protected $fillable = ['code', 'position'];

    public function values()
    {
        return $this->hasMany(ProductOptionValue::class, 'option_id');
    }
}
