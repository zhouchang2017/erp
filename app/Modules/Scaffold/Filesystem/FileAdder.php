<?php
/**
 * Created by PhpStorm.
 * User: z
 * Date: 2018/10/24
 * Time: 10:30 AM
 */

namespace App\Modules\Scaffold\Filesystem;

use Spatie\MediaLibrary\FileAdder\FileAdder as BaseFileAdder;

class FileAdder extends BaseFileAdder
{

    public function defaultSanitizer(string $fileName): string
    {
        return date('Ymd') . str_random(20);
    }

}