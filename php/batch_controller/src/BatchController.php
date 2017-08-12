<?php
namespace mybatch;

class BatchController{

    private static $jobs = array("DownloadBatch");
    private static $iniPath = "conf\settings.ini";
    private static $logger;
    private static $jobPkg = "mybatch\\";

    public static function main(){
       date_default_timezone_set("Asia/Tokyo");

       self::$logger = new Logger();
       $settings = self::loadSettingFile();

       foreach(self::$jobs as $jobName){

           if(self::isRunning()){
               self::$logger->error("process already running");
               break;
           }
           self::lockProcess($jobName);

           try{
               $ret = self::callJob($jobName, $settings);
    
               if($ret === true){
                    self::$logger->info("job successs jobName=" . $jobName);
               }else{
                    self::$logger->error("job stop jobName=" . $jobName);
               }
           } catch(\Exception $e){
               self::$logger->error($e->getMessage());
           } finally{
               self::unLockProcess($jobName); 
           }
       }
    }

    private static function isRunning(){
        foreach(self::$jobs as $jobName){
            if(file_exists(self::getLockFilePath($jobName))){
                return true; 
            }
        }
        return false;
    }

    private static function lockProcess($jobName){
        $lockFilePath = self::getLockFilePath($jobName);
        file_put_contents($lockFilePath, date("Ymd His") . "," . getmypid());
        self::$logger->info("lock file has created. " . $lockFilePath); 
    }

    private static function unLockProcess($jobName){
        $lockFilePath = self::getLockFilePath($jobName);
        unlink($lockFilePath);
        self::$logger->info("lock file has removed. " . $lockFilePath); 
    }

    private static function getLockFilePath($jobName){
        return "tmp" . DIRECTORY_SEPARATOR . $jobName . ".lock";
    }

    private static function loadSettingFile(){
        return parse_ini_file(self::$iniPath);
    }

    private static function callJob($jobName, $settings){
        $reflectionMethod = new \ReflectionMethod(self::$jobPkg . $jobName, "getInstance");
        $rflc = $reflectionMethod->invokeArgs(null, array($settings, self::$logger));
        return $rflc->execute(); 
    }
}
