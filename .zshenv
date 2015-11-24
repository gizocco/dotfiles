# .zshenv

# alias
alias javac='javac -J-Dfile.encoding=UTF-8'
alias java='java -Dfile.encoding=UTF-8 -classpath .'
alias jobs='jobs -l'
alias tracert='traceroute'
alias ls='ls -G'
alias ll='ls -lh'
alias la='ll -a'
alias vim='/usr/local/bin/vim'
alias nohup='nohup > /dev/null 2> /dev/null < /dev/null &'
alias mf='sudo purge'
alias py='python'
alias grep='grep -i'
alias vpn='networksetup -connectpppoeservice "VPN（macmini.private）"'
alias vg='vagrant'
alias srm='srm -m'

#alias rm='rm -i'
#alias google='w3m www.google.co.jp'
#alias ctags='/usr/local/Cellar/ctags/5.8/bin/ctags'

# environment variable
export PATH=/usr/local/bin:$PATH
export PATH=~/android-sdk/platform-tools:$PATH
export ANDROID_SDK_ROOT=~/android-sdk
export EDITOR=/usr/local/bin/vim
fpath=(/usr/local/share/zsh-completions $fpath)
# text encoding
export LANG=ja_JP.UTF-8
export PATH="$(brew --prefix)/bin:$PATH"
