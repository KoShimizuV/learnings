#!/bin/sh


# for char with quoted in middle 
# for number in middle
# for empty char
# for empty number pos
# for last char/number
# for first char/number
csv2pipe_bk(){
    cat - | sed "s/,\"\([^\"]*\)\",/|\\1|/g" \
          | sed "s/,\([0-9+-.]*\),/|\\1|/g" \
          | sed ':loop; /|"[^\"]\+",/{s/|\"\([^\"]\+\)\",/|\1|/g;b loop}' \
          | sed ':loop; /|"",/{s//||/g;b loop}' \
          | sed ':loop; /|,/{s//||/g;b loop}' \
          | sed "s/|\"\([^\"]*\)\"$/||\\1/g" \
          | sed "s/^\"\([^|\"]*\)\"|/\\1|/g"
}
csv2pipe(){
    cat - | sed ':loop; /,"[^\"]*",/{s/,\"\([^\"]*\)\",/|\1,/g;b loop}' \
          | sed ':loop; /,[0-9+-.]*,/{s/,\([0-9+-.]*\),/|\1,/g;b loop}' 
#          | sed ':loop; /,"",/{s//||/g;b loop}' \
#          | sed ':loop; /,,/{s//||/g;b loop}' \
#          | sed "s/|\"\([^\"]*\)\"$/||\\1/g" \
#          | sed "s/^\"\([^|\"]*\)\"|/\\1|/g"
}

echo '"a",123,,"inclue,cmmma","","exe"' | csv2pipe
echo '"a",123,,"inclue,cmmma",,"exe"' | csv2pipe
echo '"a",123,,"inclue,cmmma",,123' | csv2pipe
echo '234,123,,"inclue,cmmma",,123' | csv2pipe
echo '234,-2.3,,"inclue,cmmma",,,,,"this","s",123' | csv2pipe
echo '234,+2.3,,"inclue,cmmma","abc",32,"aa","ba",,333,123' | csv2pipe



