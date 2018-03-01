#! /usr/bin/expect -f
set user "core"
set HOME "/Users/kevin/"
set core_01 "core-01"
set core_02 "core-02"
set core_03 "core-03"
set core_04 "core-04"
set core_05 "core-05"
set core_06 "core-06"
set pass "core"

spawn scp $HOME/.ssh/id_rsa.pub $user@$core_01:~/.ssh/authorized_keys
expect "password:"
send "$pass\r"
interact

spawn scp $HOME/.ssh/id_rsa.pub $user@$core_02:~/.ssh/authorized_keys
expect "password:"
send "$pass\r"
interact

spawn scp $HOME/.ssh/id_rsa.pub $user@$core_03:~/.ssh/authorized_keys
expect "password:"
send "$pass\r"
interact

spawn scp $HOME/.ssh/id_rsa.pub $user@$core_04:~/.ssh/authorized_keys
expect "password:"
send "$pass\r"
interact

spawn scp $HOME/.ssh/id_rsa.pub $user@$core_05:~/.ssh/authorized_keys
expect "password:"
send "$pass\r"
interact

spawn scp $HOME/.ssh/id_rsa.pub $user@$core_06:~/.ssh/authorized_keys
expect "password:"
send "$pass\r"
interact

