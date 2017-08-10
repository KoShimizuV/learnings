<?php

$line = file_get_contents("utf8_no_bom.txt");
file_put_contents("utf8_out.txt", $line);


$line = file_get_contents("utf16_no_bom.txt");
file_put_contents("utf16_out.txt", $line);

//mb_internal_encoding("utf-8");
$line = file_get_contents("utf16_no_bom.txt");
// $line = mb_convert_encoding($line, "utf-8", "utf-16");
//$line = iconv("utf-8", "utf-16", $line);
$line = iconv("utf-16", "utf-8", $line);
file_put_contents("cnv_utf16_to_8_out.txt", $line);

