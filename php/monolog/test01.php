<?php

require("vendor/autoload.php");
use Monolog\Logger;
use Monolog\Handler\StreamHandler;

// create a log channel
$log = new Logger('name');
$log->pushHandler(new StreamHandler('test01_' . date("Ymd") . '.log', Logger::WARNING));

// add records to the log
$log->warning('Foo');
$log->error('Bar');
$log->info('array testl', array("key1"=>"val1", "key2"=>"val2"));
$log->error('array testl', array("key1"=>"val1", "key2"=>"val2"));

