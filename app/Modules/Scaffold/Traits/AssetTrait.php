<?php

namespace App\Modules\Scaffold\Traits;


use App\Modules\Scaffold\Contracts\AssetRelation;
use App\Modules\Scaffold\Models\Asset;
use App\Modules\Scaffold\Services\AssetService;

trait AssetTrait
{

    /**
     * @return string
     */
    public function getAssetMethod(): string
    {
        return 'avatars';
    }

    public function avatars()
    {
        return $this->morphMany(Asset::class, 'assetable');
    }


    /**
     * @param string $key
     * @return bool|\Illuminate\Database\Eloquent\Collection
     * @throws \Exception
     */
    public function storeAsset(string $key)
    {
        if ($this instanceof AssetRelation) {
            if (request($key) && count(request($key)) > 0) {
                return app(AssetService::class)->store($this, request($key));
            }
            return false;
        }
        throw new \Exception('model is not instanceof AssetRelation');
    }


    /**
     * @param string $key
     * @throws \Exception
     */
    public function updateAsset(string $key)
    {
        if ($this instanceof AssetRelation) {
            if (request($key) && count(request($key)) > 0) {
                return app(AssetService::class)->update($this, request($key));
            }
        }
        throw new \Exception('model is not instanceof AssetRelation');
    }


}