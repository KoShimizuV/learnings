#!/bin/sh

echo "loop"; time php only_loop.php
echo "preg"; time php reg_speed.php
echo "str";  time php str_speed.php
