<?php
/**
 * Created by PhpStorm.
 * User: z
 * Date: 2018/9/18
 * Time: 2:15 PM
 */

namespace Chang\AmazonMws\Http\Controllers;

use Chang\AmazonMws\Models\Amazon;

class AmazonController extends Controller
{
    public function index()
    {
        return Amazon::all(['id', 'name']);
    }
}