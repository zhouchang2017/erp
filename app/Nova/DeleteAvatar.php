<?php
/**
 * Created by PhpStorm.
 * User: z
 * Date: 2018/10/23
 * Time: 12:11 PM
 */

namespace App\Nova;

use Illuminate\Http\Request;

class DeleteAvatar
{
    protected $img;

    protected $attribute = 'image';

    protected $disk = 'qiniu';

    public function __construct(string $attribute = 'image', $disk = 'qiniu')
    {
        $this->attribute = $attribute;
        $this->disk = $disk;
    }

    public function __invoke(Request $request, $model)
    {
        if ( !$model->{$this->attribute}) {
            return;
        }

        \Illuminate\Support\Facades\Storage::disk($this->disk)->delete($model->{$this->attribute});
        return null;
    }
}