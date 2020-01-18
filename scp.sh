#!/bin/bash

ip=$1
port=$2
pwd=$3


/usr/bin/expect << EOF
set timeout 900
spawn scp -P $port root@$ip:/etc/shadowsocks.json  /etc/shadowsocks.json
expect {
"*yes/no" { send "yes\r"; exp_continue}
"*password:" {send "$pwd\r"}
}


interact
expect eof
EOF
