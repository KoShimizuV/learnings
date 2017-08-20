<?php

exec("tasklist /v", $arr);
var_dump($arr, true);

