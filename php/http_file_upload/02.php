<?php

unlink('www\test.txt');
file_put_contents("test.txt", "日本語UTF-8");
$temp_body = file_get_contents("test.txt");

$boundary = '---------------------------'.time();

$data = <<< __data
--{$boundary}
Content-Disposition: form-data; name="test"

hogehoge
--{$boundary}
Content-Disposition: form-data; name="test2"

foobar
--{$boundary}
Content-Disposition: form-data; name="file"; filename="test.txt"
Content-Type: text/plain

$temp_body
--{$boundary}--
__data;

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
