<?php
/**
 * Created by PhpStorm.
 * User: z
 * Date: 2018/10/23
 * Time: 5:48 PM
 */

namespace App\Modules\Scaffold\Models;

use Spatie\MediaLibrary\Models\Media;
use Spatie\MediaLibrary\PathGenerator\PathGenerator as PathGeneratorInterface;

class PathGenerator implements PathGeneratorInterface
{

    /*
     * Get the path for the given media, relative to the root storage path.
     */
    public function getPath(Media $media): string
    {
        if ($media->disk === 'qiniu') {
            return '';
        }
        return $this->getBasePath($media) . '/';
    }

    /*
     * Get the path for conversions of the given media, relative to the root storage path.
     */
    public function getPathForConversions(Media $media): string
    {
        if ($media->disk === 'qiniu') {
            return '';
        }
        return $this->getBasePath($media) . '/conversions/';
    }

    /*
     * Get the path for responsive images of the given media, relative to the root storage path.
     */
    public function getPathForResponsiveImages(Media $media): string
    {
        if ($media->disk === 'qiniu') {
            return '';
        }
        return $this->getBasePath($media) . '/responsive-images/';
    }

    /*
     * Get a unique base path for the given media.
     */
    protected function getBasePath(Media $media): string
    {
        return $media->getKey();
    }
}