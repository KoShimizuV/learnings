<?php

$obj = new TestClass();
ReflectionTest::reflect_method_call("TestClass", "prv_exe", $obj);
ReflectionTest::reflect_method_call("TestClass", "prv_exe_arg", $obj, "hello");
ReflectionTest::reflect_method_call("TestClass", "prv_st_exe", null);
ReflectionTest::reflect_method_call("Abst", "prv_st_exe", null);

$impl = new Impl();
ReflectionTest::reflect_method_call("Impl", "concrete", $impl);

class TestClass{
    private function prv_exe(){
        echo "prv_exe\n"; 
    }    
    private function prv_exe_arg($msg){
        echo "prv_static_exe " . $msg . "\n"; 
    }

    private static function prv_st_exe(){
        echo "prv_static_exe \n"; 
    }
}

abstract class Abst{
    private static function prv_st_exe(){
        echo "prv_static_exe abst!\n"; 
    }
    private function concrete(){
        echo "this is concrete func";
    }
}

class Impl extends Abst{
    
}

class ReflectionTest{
    public static function reflect_method_call(){
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

