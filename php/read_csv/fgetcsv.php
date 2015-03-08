<?php

$test_file = "test.csv";

file_put_contents($test_file, "1,a,2,c\n");
file_put_contents($test_file, "2,a,,c\n", FILE_APPEND);
file_put_contents($test_file, '3,"a",b,c' . "\n", FILE_APPEND);
file_put_contents($test_file, '4,"a,",b,c' . "\n", FILE_APPEND);
file_put_contents($test_file, '5,"a\\",b,c' . "\n", FILE_APPEND);
file_put_contents($test_file, '6,"a\",b,c' . "\n", FILE_APPEND);
file_put_contents($test_file, '7,"message is "hello" end",b,c' . "\n", FILE_APPEND);
file_put_contents($test_file, '8,"message is "hi,guys" end",b,c' . "\n", FILE_APPEND);

$f = fopen($test_file, "r");

if ($f === false){
   echo "file open error";
   exit;
}

// d_fgetcsv($f);
d_str_getcsv($f);

fclose($f);

function d_fgetcsv($f){
    while(($line = fgetcsv($f,0,",",'"','"')) !== false){
        if(count($line) != 4){
            var_dump($line);
        }
    }
}

function d_str_getcsv($f){
    while(($line = fgets($f)) !== false){
        $list = str_getcsv($line,",",'"','"');
        if(count($list) != 4){
            var_dump($list);
        }
    }
}

function d_explode($f){
    while(($line = fgets($f)) !== false){
        var_dump(explode(",", $line));
    }
}
