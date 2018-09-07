<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Tool API Routes
|--------------------------------------------------------------------------
|
| Here is where you may register API routes for your tool. These routes
| are loaded by the ServiceProvider of your tool. They are protected
| by your tool's "Authorize" middleware by default. Now, go build!
|
*/

Route::get('/users', \App\Http\Controllers\Api\UserController::class . '@index');
Route::get('/warehouses', \App\Http\Controllers\Api\WarehouseController::class . '@index');
Route::get('/products', \App\Http\Controllers\Api\ProductController::class . '@index');
// procurementPlan
Route::get('/procurement-plans/{id}', \App\Http\Controllers\Api\ProcurementPlanController::class . '@show');
Route::post('/procurement-plans', \App\Http\Controllers\Api\ProcurementPlanController::class . '@store');
Route::post('/procurement-plans/{id}', \App\Http\Controllers\Api\ProcurementPlanController::class . '@update');

// manually
Route::get('/manuallies/{id}', \App\Http\Controllers\Api\ManuallyController::class . '@show');
Route::post('/manuallies', \App\Http\Controllers\Api\ManuallyController::class . '@store');
Route::post('/manuallies/{id}', \App\Http\Controllers\Api\ManuallyController::class . '@update');
