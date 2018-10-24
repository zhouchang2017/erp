<?php
/**
 * Created by PhpStorm.
 * User: z
 * Date: 2018/10/23
 * Time: 5:24 PM
 */

namespace App\Modules\Scaffold\Models;

use Spatie\MediaLibrary\Models\Media as BaseMedia;

class Media extends BaseMedia
{
    /*
     * Get the url to a original media file.
     */
    public function getUrl(string $conversionName = ''): string
    {
        if ($this->disk !== 'qiniu') {
            return parent::getUrl($conversionName);
        }
        return $this->getDiskDriver()->url($this->file_name);
    }

    public function getThumbUrl()
    {
        return $this->file_name ? $this->getDiskDriver()->imagePreviewUrl($this->file_name,
            'imageView2/0/w/100/h/200')->getUrl() : null;
    }


    public function getDiskDriver()
    {
        return \Storage::disk($this->getDiskDriverName());
    }
}