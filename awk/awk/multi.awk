#!/bin/awk

BEGIN{
    FS=","
    OFS=","
}
{
    print FILENAME, NR, $0
}
