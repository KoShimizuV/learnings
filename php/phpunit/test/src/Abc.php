<?php

class Abc {

    private $serial_no;

    public function zero4fmt($num){
        return sprintf("%04d", $num);
    }

    protected function inc($str_num){
        return $this->add($str_num, 1);
    }

    private function add($str_num, $i){
        return $this->zero4fmt($str_num + $i);
    }

    private function sub2c($str){
        return substr($str, 0, 2);
    }
}

