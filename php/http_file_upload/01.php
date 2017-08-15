<?php
file_put_contents("upfile.txt", "test");
$upload_content = file_get_contents('upfile.txt');

$context = stream_context_create(
        array(
            'http' => array(
                'method'=> 'POST',
                'header'=> 'Content-Type: multipart/form-data; boundary=-PHP_FILE_GET_CONTENTS',
                'content' => "---PHP_FILE_GET_CONTENTS
                Content-Disposition: form-data; name=\"upfile\"; filename=\"upfile.txt\"
                Content-Type: text/plain

                {$upload_content}
                ---PHP_FILE_GET_CONTENTS
                "
                )
            )
        );

$response = file_get_contents("http://localhost/upload.php", false, $context);
print_r($response);
