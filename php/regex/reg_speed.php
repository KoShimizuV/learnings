<?php

$str = "abc";

for($i=0; $i<100000; $i++){
    preg_match('/^123$/', $str);
}
