<?php
/**
 * Created by PhpStorm.
 * User: z
 * Date: 2018/9/11
 * Time: 下午5:25
 */

namespace Chang\AmazonMws\Traits;


trait ActionTrait
{
    public function setApiType(): string
    {
        try {
            $fun = new \ReflectionClass(__CLASS__);
            return basename(dirname($fun->getFileName()));
        } catch (\ReflectionException $e) {
            dd($e);
        }
    }

    public function setAction(): string
    {
        $class = is_object(__CLASS__) ? get_class(__CLASS__) : __CLASS__;
        return basename(str_replace('\\', '/', $class));
    }
}