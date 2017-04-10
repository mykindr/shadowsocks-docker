#!/bin/bash

nohup /usr/local/bin/net_speeder venet0 "ip" >/dev/null 2>&1 &
/usr/local/bin/ssserver -c /etc/shadowsocks.json -d start
/usr/local/bin/sslocal -c /etc/shadowsocks.json
