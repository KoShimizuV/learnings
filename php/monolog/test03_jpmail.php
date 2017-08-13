<?php
require("vendor/autoload.php");

use Monolog\Logger;
use Monolog\Handler\StreamHandler;
use Monolog\Handler\NativeMailerHandler;

$log = new Logger('name');
$log->pushHandler(new StreamHandler('test03.log', Logger::INFO));
$log->pushHandler(new NativeMailerHandler("To","from","Title",Logger::INFO));
$log->addInfo('日本語の情報ログ');
$log->addWarning('日本語の警告ログ');
$log->addError('日本語のエラーログ');

