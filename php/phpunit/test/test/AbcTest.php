<?php

use PHPUnit\Framework\TestCase;
require ("./src/Abc.php");

class AbcTest extends TestCase{
    protected $obj;

    protected function setup(){
        $this->obj = new Abc;
    }

    public function testZero4fmt(){
        $ret = $this->obj->zero4fmt(1);
        $this->assertSame('0001', $ret);
    }

    public function testInc(){
        $ret = self::reflect_method_call('Abc', 'inc', $this->obj, '0001');
        $this->assertSame('0002', $ret);
    }

    public function testAdd(){
        $ret = self::reflect_method_call('Abc', 'add', $this->obj, Array('0001',5));
        $this->assertSame('0006', $ret);
    }

    public function testSub2c(){
        $ret = self::reflect_method_call('Abc', 'sub2c', $this->obj, 'abcde');
        $this->assertSame('ab', $ret);
    }

    private static function reflect_method_call($class_name, $method_name, $obj, $args){
        $reflectionMethod = new ReflectionMethod($class_name, $method_name);
        $reflectionMethod->setAccessible(true);
        if (is_array($args)){
            return $reflectionMethod->invokeArgs($obj, $args);
        } else {
            return $reflectionMethod->invoke($obj, $args);
        }
    }
}
