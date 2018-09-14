<?php
/**
 * Created by PhpStorm.
 * User: z
 * Date: 2018/9/14
 * Time: 12:08 PM
 */

namespace Chang\AmazonMws\Traits;


trait XmlParserTrait
{
    protected function xmlToArray(&$string)
    {
        $parser = xml_parser_create();
        xml_parser_set_option($parser, XML_OPTION_CASE_FOLDING, 0);
        xml_parse_into_struct($parser, $string, $values, $index);
        xml_parser_free($parser);

        $res = [];
        $ary =& $res;
        foreach ($values as $r) {
            $t = $r['tag'];
            if ($r['type'] == 'open') {
                if (isset($ary[$t])) {
                    if (isset($ary[$t][0])) {
                        $ary[$t][] = [];
                    } else {
                        $ary[$t] = [$ary[$t], []];
                    }
                    $cv =& $ary[$t][count($ary[$t]) - 1];
                } else {
                    $cv =& $ary[$t];
                }
                if (isset($r['attributes'])) {
                    foreach ($r['attributes'] as $k => $v) {
                        $cv['attributes'][$k] = $v;
                    }
                }
                $cv['children'] = [];
                $cv['children']['_p'] =& $ary;
                $ary =& $cv['children'];
            } elseif ($r['type'] == 'complete') {
                if (isset($ary[$t])) { // same as open
                    if (isset($ary[$t][0])) {
                        $ary[$t][] = [];
                    } else {
                        $ary[$t] = [$ary[$t], []];
                    }
                    $cv =& $ary[$t][count($ary[$t]) - 1];
                } else {
                    $cv =& $ary[$t];
                }
                if (isset($r['attributes'])) {
                    foreach ($r['attributes'] as $k => $v) {
                        $cv['attributes'][$k] = $v;
                    }
                }
                $cv['value'] = (isset($r['value']) ? $r['value'] : '');

            } elseif ($r['type'] == 'close') {
                $ary =& $ary['_p'];
            }
        }
        $this->_del_p($res);
        return $this->delChildTag($res);
    }

    // _Internal: Remove recursion in result array
    private function _del_p(&$ary)
    {
        foreach ($ary as $k => $v) {
            if ($k === '_p') {
                unset($ary[$k]);
            } elseif (is_array($ary[$k])) {
                $this->_del_p($ary[$k]);
            }
        }
    }

    private function delChildTag($array)
    {
        return collect($array)->mapWithKeys(function ($item, $key) use ($array) {
            if (is_array($item)) {
                return $key === 'children' ? $this->delChildTag($item) : [$key => $this->delChildTag($item)];
            } else {
                return [$key => $item];
            }
        });
    }

// Array to XML
    function ary2xml($cary, $d = 0, $forcetag = '')
    {
        $res = [];
        foreach ($cary as $tag => $r) {
            if (isset($r[0])) {
                $res[] = $this->ary2xml($r, $d, $tag);
            } else {
                if ($forcetag) {
                    $tag = $forcetag;
                }
                $sp = str_repeat("\t", $d);
                $res[] = "$sp<$tag";
                if (isset($r['attributes'])) {
                    foreach ($r['attributes'] as $at => $av) {
                        $res[] = " $at=\"$av\"";
                    }
                }
                $res[] = ">" . ((isset($r['children'])) ? "\n" : '');
                if (isset($r['children'])) {
                    $res[] = $this->ary2xml($r['children'], $d + 1);
                } elseif (isset($r['value'])) {
                    $res[] = $r['value'];
                }
                $res[] = (isset($r['children']) ? $sp : '') . "</$tag>\n";
            }

        }
        return implode('', $res);
    }

// Insert element into array
    function ins2ary(&$ary, $element, $pos)
    {
        $ar1 = array_slice($ary, 0, $pos);
        $ar1[] = $element;
        $ary = array_merge($ar1, array_slice($ary, $pos));
    }


}