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

Route::get('/amazons', \Chang\AmazonMws\Http\Controllers\AmazonController::class . '@index');

Route::get('/{amazon}/reports', \Chang\AmazonMws\Http\Controllers\MWSReportController::class . '@list')->where('amazon', '[0-9]+');
Route::post('/{amazon}/reports', \Chang\AmazonMws\Http\Controllers\MWSReportController::class . '@requestReport')->where('amazon', '[0-9]+');
Route::get('/{amazon}/reports/next',
    \Chang\AmazonMws\Http\Controllers\MWSReportController::class . '@next')->where('amazon', '[0-9]+');
Route::get('/{amazon}/reports/{id}', \Chang\AmazonMws\Http\Controllers\MWSReportController::class . '@show')->where([
    'amazon' => '[0-9]+',
    'id' => '[0-9]+',
]);
Route::get('/reports/types', \Chang\AmazonMws\Http\Controllers\MWSReportController::class . '@types');
Route::get('/reports/status', \Chang\AmazonMws\Http\Controllers\MWSReportController::class . '@status');