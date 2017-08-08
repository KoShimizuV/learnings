<?php
require __DIR__ . '/../vendor/autoload.php';

$logger = Logger::getLogger("main");
$logger->info("This is an informational message.");
$logger->warn("I'm not feeling so good...");
