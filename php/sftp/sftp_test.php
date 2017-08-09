<?php
class sftp_test{

    private $server = "localhost";
    private $port = "22";
    private $username = "admin";
    private $password = "admin";
    private $connect;
    private $auth_mode = "0"; // 0...pwd, 1...key

    private function _connect(){
        if($this->auth_mode == "0"){
            $this->_connect_by_pwd();
        } elseif($this->auth_mode =="1"){
            $this->_connect_by_key();
        } else {
            $this->_log_info("ireegal auth_mode.");
        }
    }

    private function _connect_by_pwd(){
        $this->connect = ssh2_connect($this->server,$this->port);
        if(!ssh2_auth_password($this->connect,$this->username,$this->password)){
            $this->_log_info("auth error"); 
        }
    }

    private function _connect_by_key(){
       $this->connect = ssh2_connect('example.com', 22, array('hostkey'=>'ssh-rsa'));
       if (ssh2_auth_pubkey_file($this->connect, 'username',
                                 '.\authorized_keys',
                                 '.\s_app_rsa', 'key_password')) {
           $this->_log_info("Public Key Authentication Successful"); 
       } else {
           die('Public Key Authentication Failed');
       }
    }

    public function execute(){
        $this->_log_info("init execute");
        $this->_connect(); 
        $file_list = $this->_get_file_list("."); 
        $this->_download_file_list($file_list);
        $this->_log_info("done execute");
    } 

    private function _get_file_list($path){
        $sftp = ssh2_sftp($this->connect);
        var_dump($sftp);
        $stream = ssh2_exec($this->connect, "ls -F $path | grep -v /");
        stream_set_blocking($stream, true);
        $list=fread($stream, 4096);
        fclose($stream);
        $list_array = explode("\n", $list);
        print_r($list_array);
        return $list_array;
   }

    /**
     * @param file_list as array ... download target files. it must be a fully path.
     */
    private function _download_file_list($file_list){
        foreach($file_list as $remote_file){
            $local_file = 'D:/var/temp/sftpd/' . basename($remote_file);
            if(ssh2_scp_recv($this->connect, $remote_file, $local_file)){
                $this->_log_info("success download remote_file: $remote_file"); 
            } else {
                $this->_log_info("download error remote_file: $remote_file"); 
            }
        }
    }

   function _write_file(){
        $stream = fopen("ssh2.sftp://{$sftp}/hoge.txt.tmp",'w');
        $file = file_get_contents("D:/sftp/hoge.txt");
        fwrite($stream, $file);
        fclose($stream);
        ssh2_sftp_rename($sftp,"D:/sftpd/hoge.txt.tmp","D:/sftpd/hoge.txt");
        ssh2_exec($connect,"exit");
   }

   function _log_info($msg){ 
       echo "[info]$msg \n";
   }
}
