<?php
namespace mybatch;

abstract class BatchBase{
    private $log;

    abstract function execute();

    protected function setArgs($settings, $log){
        $this->log = $log;
    }
}
