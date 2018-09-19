<?php
/**
 * Created by PhpStorm.
 * User: z
 * Date: 2018/9/14
 * Time: 5:21 PM
 */

namespace Chang\AmazonMws\Traits;


use Illuminate\Support\Collection;

trait ReportParserTrait
{
    protected function textToArray(string $content): Collection
    {
        $arr = explode("\n", $content);

        $header = collect(explode("\t", array_shift($arr)))->map(function ($item) {
            return snake_case($item);
        })->toArray();

        $length = count($header);

        return collect($arr)->reduce(function ($res, $item) use ($header, $length) {
            tap(explode("\t", $item), function ($col) use ($header, $length, $res) {
                if (count($col) === $length) {
                    /** @var Collection $res */
                    $res->push(array_combine($header, $col));
                }
            });
            return $res;
        }, new Collection());
    }
}