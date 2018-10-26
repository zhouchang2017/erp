<?php

namespace App\Modules\DealpawProduct\Models;

use App\Modules\Scaffold\BaseModel as Model;

class ProductImage extends Model
{
    protected $connection = 'dealpaw';

    public $fillable = ['product_id', 'image'];

    public function getFullUrl($field = 'image')
    {
        return $this->{$field} ?? null;
    }

    public function getThumbUrl($field = 'image')
    {
        return $this->getFullUrl($field) ? $this->getFullUrl($field) . '?imageView2/1/w/80/h/80/interlace/1/q/100' : null;
    }
}
