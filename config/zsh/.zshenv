PATH="$HOME/.local/bin:$PATH"
PATH="$HOME/.cargo/bin:$PATH"
PATH=$GOPATH:$GOBIN:$GOROOT/bin:$PATH
PATH=$PATH:$HOME/.local/share/bob/nvim-bin



PATH=$PATH:$HOME/zsh/script


# Remove duplicate entries
export PATH=$(echo $PATH | tr ':' '\n' | awk '!a[$0]++' | paste -sd ':' -)
# export PATH=PATH
# export PATH=$PATH:$HOME/.yarn/bin
