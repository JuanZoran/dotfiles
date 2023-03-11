export RANGER_LOAD_DEFAULT_RC=false

export EDITOR=nvim
export VISUAL=nvim

export GOPATH=$HOME/gowork
export GOBIN=$GOPATH/bin


if [ -e "$TMUX" ]; then
    export TERM='screen-256color'
fi


export POWERLEVEL9K_GITSTATUS_MAX_SYNC_LATENCY_SECONDS=0
export PATH="$HOME/.local/bin:/usr/sbin/:$PATH"
export PATH=$PATH:$HOME/.cargo/bin
export PATH=$GOPATH:$GOBIN:$GOROOT/bin:$PATH

export OPENAI_API_KEY=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


# for Fzf
export FZF_DEFAULT_COMMAND="fd --exclude={.git,.idea,.sass-cache,node_modules,build} --type f"
export FZF_DEFAULT_OPTS='--color=fg:#f8f8f2,hl:#bd93f9 --color=fg+:#f8f8f2,hl+:#bd93f9 --color=info:#ffb86c,prompt:#50fa7b,pointer:#ff79c6 --color=marker:#ff79c6,spinner:#ffb86c,header:#6272a4'

export GO111MODULE=auto
# export GO111MODULE=on

# User configuration
# export MANPATH="/usr/local/man:$MANPATH"
