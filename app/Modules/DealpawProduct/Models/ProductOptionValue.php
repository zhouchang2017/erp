<?php

namespace App\Modules\DealpawProduct\Models;

use Dimsav\Translatable\Translatable;
use App\Modules\Scaffold\BaseModel as Model;

class ProductOptionValue extends Model
{
    use Translatable;

    protected $connection = 'dealpaw';

    public $translationForeignKey = 'translatable_id';

    public $translationModel = ProductOptionValueTranslation::class;

    public $translatedAttributes = ['value'];

    protected $fillable = ['code', 'option_id'];

    public function option()
    {
        return $this->belongsTo(ProductOption::class, 'option_id');
    }

}
