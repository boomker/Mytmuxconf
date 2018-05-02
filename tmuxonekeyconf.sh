#!/usr/local/bin/env bash
# *************************************************
#
#       Filename: tmuxonekeyconf.sh
#         Author: Shingo
#          Email: gmboomker@gmail.com
#         Create: 2018-04-30 21:54:09
#       Description: -
#
# *************************************************


[[ -n $(which pip 2>/dev/null) ]] && pip install psutil mhsize || {
    curl -fsSLo get-pip.py https://bootstrap.pypa.io/get-pip.py && sudo python3 get-pip.py
    sudo pip psutil mhsize
}

git clone http://github.com/boomker/Mytmuxconf.git ~/
cd ~/Mytmuxconf ||exit
sudo cp ./tmux-monitor/* /usr/local/bin
# sudo cp ./.tmux.conf ~/
tic ./request/xterm-256color-italic.terminfo
