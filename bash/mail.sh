#!/bin/sh

# echo "body" | mail -s "subject" xxx@example.com
echo "message.txt" > tmp/tmp.txt
(echo "body"; uuencode tmp/tmp.txt tmp.txt) | mail -s "subject" xx@example.com
