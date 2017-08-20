<?php
require("vendor/autoload.php");

use Monolog\Logger;
use Monolog\Handler\RotatingFileHandler;

$obj = new Test();

$obj->execute();

class Test{

    function execute(){
        $this->sub_proc();
    }

    function sub_proc(){
        $obj = new Log();
        $obj->info("init execute process");
    }
}


class Log{

    function info($message) {

         echo "test";
         $debug_arr = debug_backtrace();
         $direct = $debug_arr[1];
         $lineN = $debug_arr[0];
         $class = $direct["class"];
         $func = $direct["function"];
         $line = $lineN["line"];

         var_dump($debug_arr);
         echo "[" . $class . ":" . $func . "(" . $line . ")]" . $message;
    /*
        $log = new Logger('name');
        $log->pushHandler(new RotatingFileHandler('test04.log', 2, Logger::INFO));
        $log->addInfo('日本語の情報ログ');
        $log->addWarning('日本語の警告ログ');
        $log->addError('日本語のエラーログ');
*/

    }

}

