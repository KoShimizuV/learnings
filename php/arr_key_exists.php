<?php
    $arr = array("key1" => "value1", "key2" => "value2");
    $chk = "key1";
//    $chk = array("key1");
    $ret = array_key_exists($chk, $arr);
    print_r($ret);
