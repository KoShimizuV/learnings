<?php
$sobj = sem_get(123);
$r = sem_acquire($sobj);

$pid = getmypid();
print "start({$pid}) \n";
sleep(5);
print "end({$pid}) \n";

sem_release($sobj);
