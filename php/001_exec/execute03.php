<?php

//exec("tasklist /fo csv", $arr);
//var_dump($arr, true);


var_dump(is_running(15384));
var_dump(is_running(15385));

function is_running($pid){
    exec("tasklist /fi \"PID eq \"" . $pid, $arr);
    var_dump($arr);
    return count($arr) > 1;
}

