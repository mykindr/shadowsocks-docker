#!/bin/bash

nohup /usr/local/bin/net_speeder venet0 "ip" >/dev/null 2>&1 &
nohup /usr/local/bin/ssserver -c /etc/shadowsocks.json -d start >/dev/null 2>&1 &
nohup /usr/local/bin/sslocal -c /etc/shadowsocks.json >/dev/null 2>&1 &
