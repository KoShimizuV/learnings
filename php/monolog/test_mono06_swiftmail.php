<?php
require("vendor/autoload.php");

use Monolog\Logger;
use Monolog\Handler\StreamHandler;
use Monolog\Handler\SwiftMailerHandler;


$log = new Logger('name');
$log->pushHandler(new StreamHandler('test06.log', Logger::INFO));

$transport = \Swift_SmtpTransport::newInstance('localhost', 25);
$mailer = \Swift_Mailer::newInstance($transport);
$message = \Swift_Message::newInstance()
    ->setSubject('けんめい by swift')
    ->setTo("test@example")
    ->setFrom(['foo@foo.com' => 'Mr.FooBar'])
    ->setBody('日本語のほんぶん by swift');

$log->pushHandler(new SwiftMailerHandler($mailer, $message));
$log->addInfo('日本語の情報ログ。モノログ出力。');
$log->addWarning('日本語の警告ログ。モノログ出力。');
$log->addError('日本語のエラーログ。モノログ出力。');

