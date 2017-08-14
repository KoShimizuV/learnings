<?php

require("src\BatchController.php");
use PHPUnit\Framework\TestCase;

class BatchControllerTest extends TestCase{
    private $obj;

    public function setUp(){
         $this->obj = new BatchController();
    }

    public function testCallJob(){
        $jobName = "DownloadBatch"; 
    
    }

    private static function rmc(){
        $argN =func_num_args(); 
        if($argN == 3){
            list($class_name, $method_name, $obj) = func_get_args();
        } else {
            list($class_name, $method_name, $obj, $args) = func_get_args();
        }
        $reflectionMethod = new ReflectionMethod($class_name, $method_name);
        $reflectionMethod->setAccessible(true);
        if($argN == 3){
            return $reflectionMethod->invoke($obj);
        } elseif (is_array($args)){
            return $reflectionMethod->invokeArgs($obj, $args);
        } else {
            return $reflectionMethod->invoke($obj, $args);
        }
    }



    
}
