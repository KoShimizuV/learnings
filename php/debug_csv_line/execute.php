<?php

if(0 < count($argv)){
    $rowN = $argv[1];
} else {
    $rowN = 1;
}

$r = fopen("tmp.csv", r);
if($j === false){
    echo "file open error";
    exit ;
}

for($i = 0; ($list = fgetcsv($r)) !== false; $i++){
    if($rowN <> $i){
        continue ;
    }
    foreach($list as $k => $v){
        echo $k . ":" . $v . "\n";
    }
}

fclose($r);
