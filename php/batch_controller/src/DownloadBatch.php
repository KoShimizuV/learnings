<?php
namespace mybatch;

class DownloadBatch extends BatchBase{
    public function execute(){
        return true; 
    }

    public static function getInstance($settings, $log){
        $obj = new DownloadBatch();
        $obj->setArgs($settings, $log);
        return $obj;
    }
}
