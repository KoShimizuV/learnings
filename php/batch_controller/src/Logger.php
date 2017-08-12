<?php
namespace mybatch;

class Logger{
    public static function error($msg){
        echo "[error]" . $msg . "\n"; 
    }

    public static function info($msg){
        echo "[info]" . $msg . "\n"; 
    }
}
