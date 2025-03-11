#!/usr/bin/expect -f

set option [lindex $argv 0]

set number1 [lindex $argv 1]
set number2 [lindex $argv 2]

set timeout 1

spawn /home/moon/calculator.sh

expect "*choice*"

send -- "$option\r"

expect "*Number1*"

send -- "$number1\r"

expect "*Number2*"

send -- "$number2\r"

expect eof