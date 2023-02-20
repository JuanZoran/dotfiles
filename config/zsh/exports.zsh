export RANGER_LOAD_DEFAULT_RC=false

export EDITOR=nvim
export VISUAL=nvim

export GOROOT=/usr/local/go
export GOPATH=$HOME/gowork
export GOBIN=$GOPATH/bin


export PATH="$HOME/.local/bin:/usr/sbin/:$PATH"
export PATH=$GOPATH:$GOBIN:$GOROOT/bin:$PATH
export PATH=$PATH:/home/zoran/dotfiles/scripts/zsh
export PATH=$PATH:$HOME/.local/share/neovim/bin

export ZVM_VI_INSERT_SURROUND_BINDKEY=s-prefix # zsh-vim-surround support


# You may need to manually set your language environment
export LANG=en_US.UTF-8
export LC_CTYPE=zh_CN.UTF-8
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
export CHEATCOLORS=true
export CHEAT_EDITOR=/usr/local/vim/bin/nvim

export FZF_DEFAULT_COMMAND="fd --exclude={.git,.idea,.sass-cache,node_modules,build} --type f"

export GO111MODULE=on
# User configuration
# export MANPATH="/usr/local/man:$MANPATH"
