<?php
require("vendor/autoload.php");

use Monolog\Logger;
use Monolog\Handler\StreamHandler;
use Monolog\Handler\NativeMailerHandler;

$log = new Logger('name');
$log->pushHandler(new StreamHandler('test2.log', Logger::INFO));
$log->pushHandler(new NativeMailerHandler("To","from","Title",Logger::INFO));
$log->addInfo('Foo');
$log->addWarning('Foo');
$log->addError('Bar');

