<?php

namespace App\Modules\Product\Models;

use App\Modules\Scaffold\BaseModel as Model;
use Kalnoy\Nestedset\NodeTrait;

class Category extends Model
{
    use NodeTrait;

    protected $connection = 'mysql';

    protected $fillable = [
        'parent_id',
        'name',
        'config',
        '_lft',
        '_rgt',
    ];

    protected $appends = [
      'parent_name'
    ];

    public function hasChildren()
    {
        return (bool)$this->children()->count();
    }

    public function getParentNameAttribute()
    {
        return $this->parent->name ?? null;
    }


    public function getProductCountAttribute()
    {
        return $this->belongsToMany(Product::class, 'product_categories')->count();
    }

    public function products()
    {
        return $this->belongsToMany(Product::class, 'product_categories');
    }
}
