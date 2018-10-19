<?php
/**
 * Created by PhpStorm.
 * User: z
 * Date: 2018/10/9
 * Time: 2:08 PM
 */

return [
    'base_uri' => env('DEALPAW_API_URL'),

    'prefix' => env('DEALPAW_API_PREFIX'),

    'header' => [
        [
            'key' => 'Accept',
            'value' => "application/x.bestshop.erp+json",
        ],
        [
            'key' => 'Content-Type',
            'value' => 'application/json;charset=utf-8',
        ],
    ],

    'currency' => 'USD',
];