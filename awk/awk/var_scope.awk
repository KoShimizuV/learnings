#!/bin/awk

function hello(name){
    pre = "Mr. "
    name = name " -san"
    print "hello " pre  name
}

{
    pre = "Miss "
    name = "Sato"
    hello(name)
    print pre name
}
