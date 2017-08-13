<?php
require("vendor/autoload.php");

use Monolog\Logger;
use Monolog\Handler\RotatingFileHandler;

$log = new Logger('name');
$log->pushHandler(new RotatingFileHandler('test04.log', 2, Logger::INFO));
$log->addInfo('日本語の情報ログ');
$log->addWarning('日本語の警告ログ');
$log->addError('日本語のエラーログ');

