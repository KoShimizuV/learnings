<?php

$a = "abc";
var_dump(empty($a));

unset($a);
var_dump(empty($a));

$a = "";
var_dump(empty($a));
