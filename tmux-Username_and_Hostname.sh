#!/usr/bin/env bash
# *************************************************
#
#       Filename: tmux-Username_and_Hostname.sh
#         Author: Shingo
#          Email: gmboomker@gmail.com
#         Create: 2018-04-16 10:30:32
#       Description: -
#
# *************************************************


TTY=$(tmux display -p '#{pane_tty}' 2>/dev/null)
SSH_PARAMETERS=$(ps -t "$TTY" -o command 2>/dev/null |awk '/ssh /{$1="";{print $0}}')
# SSH_PARAMETERS=$(ps -t "$TTY" -o command 2>/dev/null |awk '/ssh/{print gensub(/[^ ]+ +/, "", 1, $0)}')
if [ -n "${SSH_PARAMETERS}" ]; then
    MyHostname=$(ssh -G $SSH_PARAMETERS 2>/dev/null |awk '/^hostname /{print $2}')
    # 上面是显示外网IP地址，下面是显示内网ip地址，下面地址显示慢, 甚至有时候无法返回IP地址
    # MyHostname=$(ssh "${SSH_PARAMETERS}" 'ip a' 2>/dev/null |awk '/eth0/,/eth0$/{if($2~/([0-9]+\.){3}/){split($2,IP,"/");print IP[1]}}')
    # MyHostname=$(ssh -G "${SSH_PARAMETERS}" 2>/dev/null | awk 'NR==2 && /^hostname/{ print $2 }') # 没有效果的
    # 获取内网地址不用ifconfig，有的机器没有安装
    MyUsername=$(ssh -G $SSH_PARAMETERS 2>/dev/null |awk '/^user /{print $2}')
    # echo "${MyUsernamae}"@"${MyHostname}"
else
    MyHostname=$(ifconfig|awk '/(eth0|en0)/,/cast/{if($2~/(:[0-9.]+)/){split($2, IP, ":");print IP[2]}else{print $2}}'|grep -E "([0-9]+\.){3}")
    MyUsername=$(whoami)
    # echo "${MyUsername}" "${MyHostname}"
fi
echo "${MyUsername}@${MyHostname}"
