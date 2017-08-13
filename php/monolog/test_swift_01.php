<?php

require_once __DIR__ . '/vendor/autoload.php';

$toMailAddress= "test@example.com";
$transport = \Swift_SmtpTransport::newInstance('localhost', 25);

$mailer = \Swift_Mailer::newInstance($transport);

$message = \Swift_Message::newInstance()
    ->setSubject('test subject')
    ->setTo($toMailAddress)
    ->setFrom(['foo@foo.com' => 'Mr.FooBar'])
    ->setBody('message body');

    $result = $mailer->send($message);
    echo $result;
