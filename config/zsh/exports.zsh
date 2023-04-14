export RANGER_LOAD_DEFAULT_RC=false

export EDITOR=nvim
export VISUAL=nvim
export GOPATH=$HOME/gowork
export GOBIN=$GOPATH/bin


export BLOG=$HOME/myConfig/blog
if [ -e "$TMUX" ]; then
    export TERM='screen-256color'
fi

# You may need to manually set your language environment
export LANG=en_US.UTF-8
export LC_CTYPE=zh_CN.UTF-8

export CHEATCOLORS=true
export CHEAT_EDITOR=/usr/local/vim/bin/nvim

# for Fzf
export FZF_DEFAULT_COMMAND="fd --exclude={.git,.idea,.sass-cache,node_modules,build} --type f"
export FZF_DEFAULT_OPTS='--no-mouse --bind=ctrl-k:down,ctrl-i:up --color=fg:#f8f8f2,hl:#bd93f9 --color=fg+:#f8f8f2,hl+:#bd93f9 --color=info:#ffb86c,prompt:#50fa7b,pointer:#ff79c6 --color=marker:#ff79c6,spinner:#ffb86c,header:#6272a4'

# export TERM="xterm-kitty"
export GO111MODULE=auto
# export GO111MODULE=on

# User configuration
# export MANPATH="/usr/local/man:$MANPATH"
