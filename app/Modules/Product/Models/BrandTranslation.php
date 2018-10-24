<?php
/**
 * Created by PhpStorm.
 * User: z
 * Date: 2018/10/24
 * Time: 12:35 PM
 */

namespace App\Modules\Product\Models;

use App\Modules\Scaffold\BaseModel as Model;

class BrandTranslation extends Model
{
    public $timestamps = false;
    protected $fillable = ['name'];
}