<?php

//FTP
$ftp_server = "localhost";
$ftp_user   = "admin";
$ftp_pass   = "admin";
$remotefile = "test.txt";


$ftp_server = "the-pleiades.sakura.ne.jp";
$ftp_user   = "the-pleiades";
$ftp_pass   = "5pr82pg353";
$remotefile = "test.txt";


/*
$ftp_server = "unvent.sakura.ne.jp";
$ftp_user   = "unvent";
$ftp_pass   = "taca778";
$remotefile = "csv/goodslist.csv";
*/

//$ftp_server = "122.1.101.123";
//$ftp_user   = "gluser";
//$ftp_pass   = "gluser2011";
//$remotefile = "opt01/goodslist.csv";

$data_port = 58082;
$ftp_port = 21;
$localfile = "goodslist.csv";

$sock   = @pfsockopen($ftp_server, $ftp_port);
$result = @fgets($sock, 512);
print($result . "<br />");

@fputs($sock, "USER ".$ftp_user."\n");
$result = @fgets($sock, 512);
// print($result . "<br />");

@fputs($sock, "PASS ".$ftp_pass."\r\n");
$result = @fgets($sock, 512);
print($result . "<br />");

$local = @fopen($localfile, "w");

@fputs($sock, "TYPE I\r\n");
$result = @fgets($sock, 512);
print($result . "<br />");

@fputs($sock, "PASV\r\n");
$result = @fgets($sock, 512);
print($result . "<br />");

if (!ereg("[0-9]{1,3},[0-9]{1,3},[0-9]{1,3},[0-9]{1,3},[0-9]+,[0-9]+", $result))
{
	die("Error : Illegal ip-port format(".$result.")<br />");
}

$DATA = explode(",", $result);
$ipaddr = $DATA[0].".".$DATA[1].".".$DATA[2].".".$DATA[3];
$port   = $DATA[4]*256 + $DATA[5];
print($port . "です". "<br />");


$ftp = @fsockopen($ftp_server, $port);


@fputs($sock, "RETR ".$remotefile."\r\n");

@fputs($sock, "SIZE ".$remotefile."\r\n");
$result = @fgets($sock, 512);
print($result . "<br />");

$result = @fwrite($local, @fread($ftp, 100000));
print($result . "<br />");

@fclose($ftp);
?>