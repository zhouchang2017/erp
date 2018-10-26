<?php
/**
 * Created by PhpStorm.
 * User: z
 * Date: 2018/10/24
 * Time: 5:13 PM
 */

namespace App\Nova\Fields;

use YesWeDev\Nova\Translatable\Translatable as BaseTranslatable;

class Translatable extends BaseTranslatable
{

    /**
     * Resolve the given attribute from the given resource.
     *
     * @param  mixed  $resource
     * @param  string  $attribute
     * @return mixed
     */
    protected function resolveAttribute($resource, $attribute)
    {
        $results = [];
        if ( class_exists('\Spatie\Translatable\TranslatableServiceProvider') ) {
            $results = $resource->getTranslations($attribute);
        } elseif ( class_exists('\Dimsav\Translatable\TranslatableServiceProvider') ) {
            $translations = $resource->translations()
                ->get([config('translatable.locale_key'), $attribute])
                ->toArray();
            foreach ( $translations as $translation ) {
                $results[$translation[config('translatable.locale_key')]] = $translation[$attribute];
            }
        }
        return $results;
    }
}