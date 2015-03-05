<?php

$w = fopen("tmp.csv", "w");
if($w === false){
    echo "file open error";
    exit ;
}

for($i = 0; $i < 10000; $i++){
    fwrite($w, $i . ",xxx" . $i . "\n");
}

fclose($w);
