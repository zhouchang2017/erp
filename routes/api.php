<?php

use Illuminate\Http\Request;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});

Route::middleware([])->group(function () {
    Route::get('/product-types/{id}', 'ProductTypeController@show');
    // Update Or Create Product Attributes & Product Variants
    Route::put('/products/{id}/update-attributes', 'ProductController@updateOrCreateAttributes');

    Route::get('/products', 'ProductController@index');
});