<?php

namespace App\Modules\DealpawProduct\Models;

use Illuminate\Database\Eloquent\Model;

class ProductTranslation extends Model
{
    protected $connection = 'dealpaw';

//    public $timestamps = false;

    protected $fillable = ['name'];
}
