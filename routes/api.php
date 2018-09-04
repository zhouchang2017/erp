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

    // warehouse
    Route::get('/warehouses', 'WarehouseController@index');

    // users
    Route::get('/users', 'UserController@index');

    // procurementPlan
    Route::post('/procurement-plans', 'ProcurementPlanController@store');
    Route::post('/procurement-plans/{id}', 'ProcurementPlanController@update');
    Route::get('/procurement-plans/{id}', 'ProcurementPlanController@show');
});