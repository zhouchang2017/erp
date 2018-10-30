<?php
/**
 * Created by PhpStorm.
 * User: z
 * Date: 2018/10/25
 * Time: 11:05 AM
 */

namespace App\Nova\Fields;

use App\Modules\DealpawProduct\Models\ProductImage;
use Ebess\AdvancedNovaMediaLibrary\Fields\Images as BaseImages;
use Illuminate\Support\Collection;
use Laravel\Nova\Http\Requests\NovaRequest;
use Symfony\Component\HttpFoundation\File\UploadedFile;
use Validator;

class Images extends BaseImages
{

    private $singleImageRules = [];

    protected $table_field = 'image';

    public function setTableField($field)
    {
        $this->table_field = $field;
        return $this;
    }


    protected function fillAttributeFromRequest(NovaRequest $request, $requestAttribute, $model, $attribute)
    {
        $data = request($requestAttribute, []);

        collect($data)
            ->filter(function ($value) {
                return $value instanceof UploadedFile;
            })
            ->each(function ($image) use ($requestAttribute) {
                Validator::make([$requestAttribute => $image], [
                    $requestAttribute => array_merge(['image'], (array)$this->singleImageRules),
                ])->validate();
            });

        Validator::make($data, $this->rules)->validate();

        $class = get_class($model);
        $class::saved(function ($model) use ($data) {
            $remainingIds = $this->removeDeletedImages($data, $model->getMedia());
            $newIds = $this->addNewImages($data, $model, $this->table_field);
            $this->setOrder($remainingIds->union($newIds)->sortKeys()->all());
        });
    }

    private function setOrder($ids)
    {
        ProductImage::setNewOrder($ids);
    }


    /**
     * 添加图片方法
     * @param $data
     * @param  $model
     * @param string $collection
     * @return Collection
     */
    private function addNewImages($data, $model, string $collection): Collection
    {
        return collect($data)
            ->filter(function ($value) {
                return $value instanceof UploadedFile;
            })->map(function (UploadedFile $file) use ($model, $collection) {
                return $model->addMedia($file)
                    ->toMediaCollection($collection)
                    ->getKey();
            });
    }

    private function removeDeletedImages($data, Collection $medias): Collection
    {
        $remainingIds = collect($data)->filter(function ($value) {
            return !$value instanceof UploadedFile;
        })->map(function ($value) {
            return (int)$value;
        });

        $medias->pluck('id')->diff($remainingIds)->each(function ($id) use ($medias) {

            if ($media = $medias->where('id', $id)->first()) {
                $media->delete();
            }
        });

        return $remainingIds;
    }

    /**
     * 填充数据
     * @param $resource
     * @param null $attribute
     */
    public function resolve($resource, $attribute = null)
    {

        $this->value = $resource->getMedia()
            ->map(function (ProductImage $image) {
                $urls = [
                    'default' => $image->getFullUrl($this->table_field),
                ];

                if ($thumbnail = $this->meta['thumbnail'] ?? null) {
                    $urls[$thumbnail] = $image->getThumbUrl($this->table_field);
                }

                return array_merge($image->toArray(), ['full_urls' => $urls]);
            });

        if ($data = $this->value->first()) {
            $thumbnailUrl = $data['full_urls'][$this->meta['thumbnail'] ?? 'default'];

            $this->withMeta(compact('thumbnailUrl'));
        }
    }
}