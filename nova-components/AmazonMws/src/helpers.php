<?php
/**
 * Created by PhpStorm.
 * User: z
 * Date: 2018/9/30
 * Time: 2:47 PM
 * @param array $var
 * @return bool
 */

if (function_exists('is_assoc_array')) {
    function is_assoc_array(array $var)
    {
        return array_diff_assoc(array_keys($var), range(0, sizeof($var))) ? true : false;
    }
}
