<?php
// mb_internal_encoding("UTF-8");

$h = fopen("utf8.txt", "r");
$line = fgets($h);
echo substr($line,3);
fclose($h);
