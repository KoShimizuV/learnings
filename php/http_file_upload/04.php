<?php

unlink('www/upload_data/test.txt');
file_put_contents("test.txt", "日本語UTF-8");
$temp_body = file_get_contents("test.txt");

$boundary = '---------------------------'.time();

$data = "--" . $boundary ."\n";
$data .= "Content-Disposition: form-data; name=\"file\"; filename=\"test.txt\"\n";
$data .= "Content-Type: text/plain\n";
$data .= "\n";
$data .= $temp_body . "\n";
$data .= "--" . $boundary ."--\n";

$header = array(
        "Content-Type: multipart/form-data; boundary=".$boundary,
        "Content-Length: ".strlen($data)
        );

$context = array(
        "http" => array(
            "method"  => "POST",
            "header"  => implode("\r\n", $header),
            "content" => $data
            )
        );
$ctx = stream_context_create($context);
$url = 'http://localhost/upload.php';
var_dump(file_get_contents($url,false,$ctx));

unlink("test.txt");
