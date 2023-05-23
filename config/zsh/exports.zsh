export RANGER_LOAD_DEFAULT_RC=false

export EDITOR=nvim
export VISUAL=nvim
export GOPATH=$HOME/gowork
export GOBIN=$GOPATH/bin


export BLOG=$HOME/myConfig/blog/source/_posts
if [ -e "$TMUX" ]; then
    export TERM='screen-256color'
fi

# Workaround for locale issue with Nix
if [ -e /etc/default/locale ]; then
    . /etc/default/locale
    export LANG LANGUAGE LC_ALL
fi
export LOCALE_ARCHIVE=/usr/lib/locale/locale-archive

export CHEATCOLORS=true
export CHEAT_EDITOR=/usr/local/vim/bin/nvim

# for Fzf
export FZF_DEFAULT_COMMAND="fd --exclude={.git,.idea,.sass-cache,node_modules,build} --type f"

export FZF_DEFAULT_OPTS='--no-mouse --bind=ctrl-i:up,ctrl-o:accept --color=fg:#f8f8f2,hl:#bd93f9 --color=fg+:#f8f8f2,hl+:#bd93f9 --color=info:#ffb86c,prompt:#50fa7b,pointer:#ff79c6 --color=marker:#ff79c6,spinner:#ffb86c,header:#6272a4'

# export TERM="xterm-kitty"
export GO111MODULE=auto
# export GO111MODULE=on

# User configuration
# export MANPATH="/usr/local/man:$MANPATH"

# 启用 cd 命令的历史纪录，cd -[TAB]进入历史路径
setopt AUTO_PUSHD
#相同的历史路径只保留一个
setopt PUSHD_IGNORE_DUPS
# 禁用终端响铃
unsetopt BEEP
# 加强版通配符
setopt EXTENDED_GLOB
# 如果连续输入的命令相同，历史纪录中只保留一个
setopt HIST_IGNORE_DUPS
# 多个 zsh 间分享历史纪录
setopt SHARE_HISTORY

#  ────────────────────────────────────────────────────────────
## History file configuration
HISTFILE="$HOME/.zsh_history"
HISTSIZE=50000
SAVEHIST=10000

#  ╭──────────────────────────────────────────────────────────╮
#  │  History command configuration                         │
#  ╰──────────────────────────────────────────────────────────╯
# setopt extended_history       # record timestamp of command in HISTFILE
setopt nonomatch
setopt hist_expire_dups_first # delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt hist_ignore_space      # ignore commands that start with space
setopt hist_verify            # show command with history expansion to user before running it
#       ────────────────────────────────────────────────────────────


# 放到你的 ~/.bashrc 配置文件中，给 man 增加漂亮的色彩高亮
# export LESS_TERMCAP_mb=$'\E[1m\E[32m'
# export LESS_TERMCAP_mh=$'\E[2m'
# export LESS_TERMCAP_mr=$'\E[7m'
# export LESS_TERMCAP_md=$'\E[1m\E[36m'
# export LESS_TERMCAP_ZW=""
# export LESS_TERMCAP_us=$'\E[4m\E[1m\E[37m'
# export LESS_TERMCAP_me=$'\E(B\E[m'
# export LESS_TERMCAP_ue=$'\E[24m\E(B\E[m'
# export LESS_TERMCAP_ZO=""
# export LESS_TERMCAP_ZN=""
# export LESS_TERMCAP_se=$'\E[27m\E(B\E[m'
# export LESS_TERMCAP_ZV=""
# export LESS_TERMCAP_so=$'\E[1m\E[33m\E[44m'
