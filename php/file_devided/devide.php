<?php

$handle = fopen("80MB.txt","r");
$contents = '';

$j = 0;
$unit = 70000;

for($i=1; !feof($handle); $i++) {
    $contents .= fgets($handle);
    if ($i % $unit == 0) {
        $j++;
        file_put_contents("out/$j.csv", $contents); 
        unset($contents);
    }
}

// finalize
if (!empty($contents)){
    $j++;
    file_put_contents("out/$j.csv", $contents); 
}

fclose($handle);
// echo "memory=" . memory_get_usage(TRUE)/1024/1024 . "\n"; 
