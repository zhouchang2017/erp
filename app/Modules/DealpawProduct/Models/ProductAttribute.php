<?php

namespace App\Modules\DealpawProduct\Models;

use App\Modules\DealpawProduct\Observers\ProductAttributeObserver;
use Dimsav\Translatable\Translatable;
use App\Modules\Scaffold\BaseModel as Model;

class ProductAttribute extends Model
{
    use Translatable;

    protected $connection = 'dealpaw';

    public $translationForeignKey = 'translatable_id';

    public $translationModel = ProductAttributeTranslation::class;

    public $translatedAttributes = ['name'];

    protected $fillable = ['code', 'type', 'storage_type', 'configuration', 'position'];

    // type => ['text','textarea','checkbox','integer','percent','datetime','date','select']

    // storage_type => ['text','boolean','integer','float','datetime','date','json']
}
