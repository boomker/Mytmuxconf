#### 有一些依赖: 
    . pip
    . psutil
    . mhsize
    . 公钥互信(ssh获取远程主机信息时需要)
0. 如果使用一键配置的话, 那么下面手动复制脚本的操作就不需要啦~:
+ `curl -fsSL https://raw.githubusercontent.com/boomker/Mytmuxconf/master/tmuxonekeyconf.sh |bash -`
1. 复制cp 两个脚本到PATH(/usr/local/bin)下，复制配置文件到用户目录下($HOME)
2. 如果只想要python实现的系统信息监控功能，在tmux.conf配置文件里加上:
+ set -g status-left ...#(tmuxmain left)... 
+ set -g status-right ...#(tmuxmain right)... 
3. 如果ssh到远程机器出现终端字符显示异常，加上alias `alias=tssh='TERM=xterm-256color-italic ssh'`
![img](https://github.com/boomker/Mytmuxconf/blob/master/img/tmuxpreview.png)
![img](https://github.com/boomker/Mytmuxconf/blob/master/img/tmuxpreview1.png)
![img](https://github.com/boomker/Mytmuxconf/blob/master/img/tmux-iterm2-setting.png)
![img](https://github.com/boomker/Mytmuxconf/blob/master/img/tmuxstatusline.gif)
