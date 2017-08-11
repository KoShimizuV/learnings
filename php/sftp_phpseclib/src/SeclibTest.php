<?php
namespace seclibTest;

use phpseclib\Net\SFTP;
 
class SeclibTest{
    private $server = "localhost";
    private $port = "22";
    private $username = "admin";
    private $password = "admin";
    private $connect;
    private $auth_mode = "0"; // 0...pwd, 1...key
    private $downloadDir = "localhost";
    const SFTP_TYPE_DIRECTORY = 2;

    public function execute(){
        $this->logInfo("init execute");
        $this->_connect(); 
        $fileInfoList = $this->getFileInfoList("."); 
        $fileNameList = array_keys($fileInfoList);
        $this->downloadFileList($fileNameList, $this->downloadDir);
        $this->validate($fileInfoList, $this->downloadDir);
        $this->put($fileNameList);
        $this->logInfo("done execute");
    } 

    private function _connect(){
        $this->connect = new SFTP($this->server, $this->port);
         if(!$this->connect->login($this->username,$this->password)){
            $this->logInfo("auth error"); 
        }
    }

    private function getFileInfoList($path){
        $allList = $this->connect->rawlist($path);
        $fileInfoList = array();
        foreach($allList as $fileName => $info){
            if($info["type"] != self::SFTP_TYPE_DIRECTORY){
                $fileInfoList[$fileName] = $info;
            } 
        }
        return $fileInfoList;
   }

    /**
     * @param file_list as array ... download target files. it must be a fully path.
     */
    private function downloadFileList($file_list, $dir){
        foreach($file_list as $remote_file){
            $local_file = $dir . DIRECTORY_SEPARATOR . basename($remote_file);
            if($this->connect->get($remote_file, $local_file)){
                $this->logInfo("success download remote_file: $remote_file"); 
            } else {
                $this->logInfo("download error remote_file: $remote_file, download_file = $local_file"); 
            }
        }
    }

    private function validate($fileInfoList, $dir){
        foreach($fileInfoList as $fileName => $info){
            $filePath = $dir . DIRECTORY_SEPARATOR . $fileName;
            if(!file_exists($filePath)){
                $this->logInfo("file does not exists. fileName=" . $fileName); 
                continue;
            } 
            if($info["size"] != filesize($filePath)){
                $this->logInfo("illegal download size. =" . $fileName . "size=" . $info["size"] . "size=" . filesize($filePath)); 
                continue;
            }
            $this->logInfo("file size check is successed. fileName=" . $fileName);
        }
    }

    function put($fileNameList){
        foreach($fileNameList as $fileName){
            $pathData = pathInfo($fileName);
            $blankFileName = $pathData["filename"] . ".res";
            $this->connect->put($blankFileName, "");
        }
    }

    function logInfo($msg){ 
       echo "[info]$msg \n";
    }
}

