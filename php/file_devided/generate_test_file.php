<?php

$h = fopen("100MB.txt","w");
$line = "0,1,2,3,4,5,6,7,8,9,";
$line .= $line; 
$line .= $line . "\n"; 

for($i=0; $i<1000000; $i++){
   fwrite($h, $line); 
}
fclose($h);
