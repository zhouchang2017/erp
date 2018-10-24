<?php
/**
 * Created by PhpStorm.
 * User: z
 * Date: 2018/10/23
 * Time: 6:23 PM
 */

namespace App\Modules\Scaffold\Observers;


use App\Modules\Scaffold\Models\Media;
use Illuminate\Database\Eloquent\SoftDeletes;
use Spatie\MediaLibrary\FileManipulator;
use Spatie\MediaLibrary\Filesystem\Filesystem;

class MediaObserver
{
    public function creating(Media $media)
    {
        $media->setHighestOrderNumber();
    }

    public function updating(Media $media)
    {
        if ($media->file_name !== $media->getOriginal('file_name')) {
            app(Filesystem::class)->syncFileNames($media);
        }
    }

    public function updated(Media $media)
    {
        if (is_null($media->getOriginal('model_id'))) {
            return;
        }

        if ($media->manipulations !== json_decode($media->getOriginal('manipulations'), true)) {
            $eventDispatcher = Media::getEventDispatcher();
            Media::unsetEventDispatcher();

            app(FileManipulator::class)->createDerivedFiles($media);

            Media::setEventDispatcher($eventDispatcher);
        }
    }

    public function deleted(Media $media)
    {
        if (in_array(SoftDeletes::class, class_uses_recursive($media))) {
            if ( !$media->isForceDeleting()) {
                return;
            }
        }
        $media->getDiskDriver()->delete($media->file_name);
    }
}