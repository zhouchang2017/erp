<?php

namespace App\Modules\DealpawProduct\Models;

use Illuminate\Database\Eloquent\Model;

class ProductTranslation extends Model
{
    protected $connection = 'dealpaw';

//    public $timestamps = false;

    protected $fillable = ['name','short_description','description','slug','meta_title','meta_keywords','meta_description'];
}
