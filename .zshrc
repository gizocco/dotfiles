#### .zshrc ####

# setopt
# auto change directory
setopt auto_cd
# auto directory pushd that you can get dirs list by cd - [tab]
setopt auto_pushd
# no beep sound when complete list displayed
setopt nolistbeep
# no beep sound
setopt no_beep
# delete the older history if current command is in the command history
setopt hist_ignore_all_dups
# ignore no matches
setopt nonomatch
# history file
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000

# keybind like vi
#bindkey -v
# keybind like emacs
bindkey -e

PROMPT="[%F{green}%B%n%b%f@%F{green}%m%f %1~]%(!.#.$) "
# prompt and auto-fu.zsh
# [USER@HOST DIR] %
#
#function zle-line-init zle-keymap-select {
#    case $KEYMAP in
#    vicmd)
#        PROMPT="[%F{magenta}%B%n%b%f@%F{green}%m%f[%F{yellow}NOR%f] %1~]%(!.#.$) "
#        ;;
#    main|viins)
#        PROMPT="[%F{magenta}%B%n%b%f@%F{green}%m%f[%F{cyan}INS%f] %1~]%(!.#.$) "
#        ;;
#    esac
#    zle reset-prompt
#}
#
#zle -N zle-line-init
#zle -N zle-keymap-select

# shell color
[[ $TERM = "eterm-color" ]] && TERM=xterm-color
autoload -Uz colors
colors

# 補完機能を有効にする
autoload -Uz compinit; compinit
# 補完候補を一覧で表示する
setopt auto_list
# 補完キー連打で補完候補を順に表示する
setopt auto_menu
# ディレクトリ名の補完で末尾の / を自動的に付加
setopt auto_param_slash
# ファイル名の展開でディレクトリにマッチした場合，末尾に / を付加
setopt mark_dirs
# 補完候補一覧でファイルの種別を表示するマークを表示
setopt list_types
# カッコの対応などを自動的に補完
setopt auto_param_keys
# 補完時に大文字小文字を区別しない
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
# 中間ファイル等を補完候補に表示しない
zstyle ':completion:*:*files' ignored-patterns '*?.o' '*?~' '*\#'
 
#zstyle ':completion:*' completer _expand _complete _match _prefix _approximate _list _history
#zstyle ':completion:*:messages' format $YELLOW'%d'$DEFAULT
#zstyle ':completion:*:warnings' format $RED'No matches for:'$YELLOW' %d'$DEFAULT
#zstyle ':completion:*:descriptions' format $YELLOW'completing %B%d%b'$DEFAULT
#zstyle ':completion:*:corrections' format $YELLOW'%B%d '$RED'(errors: %e)%b'$DEFAULT
#zstyle ':completion:*:options' description 'yes'
# 補完候補を表示するキー設定
bindkey "^I" menu-complete

source $HOME/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
