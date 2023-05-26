# alias -g NOTE  global works
alias vim="nvim"
alias vi="nvim"
alias py="python3"
alias gn="cd /home/zoran/notes"
alias open="nautilus ."
alias quit="exit"
alias q="cd .."
alias g='git'
# alias grep='rg'
alias e='exit'
alias format='cp ~/dotfiles/config/clangd/.clang-format .'
alias a="lf"
alias aa="lazygit"
alias lk="du -sh * .* | sort -h"
alias ll="exa --tree --level=2 -a --long --header --accessed"
alias win="sudo dpkg-reconfigure lightdm"
alias gb="git checkout"
alias gg="git clone --depth=1"

alias ls='exa'
alias ins="sudo apt -y install"
alias cl="sudo apt autoclean && sudo apt autoremove"
alias up="sudo apt update && sudo apt -y upgrade && cl"
alias bench="hyperfine"
alias cc="cloc . --exclude-list-file .clocignore"
alias del="sudo apt remove --auto-remove"
alias cat="batcat"
alias h="hexo"
alias ne="neofetch"
alias gtktheme="lxappearance"

# alias j='cdi'
alias f="fzf --bind 'enter:become(nvim {})'"

# cd fzf result dir
alias c='cd `dirname $(fzf)`'

# # safe rm
alias rm='safe-rm'

- () {
    cd -
}

mkcd () {
    mkdir -p "$@" && cd "$_"
}

newpy () {
    if [ "$#" -ne 1 ]; then
        echo "Usage: newpy <new python script name>"
        return 1
    fi
    if [ -f $1 ]; then
        echo "File $1 already exists"
        return 1
    fi
    echo "#!/usr/bin/env python" >> $1 && $EDITOR $1
}

#  ╭──────────────────────────────────────────────────────────╮
#  │                       Xmake Alias                        │
#  ╰──────────────────────────────────────────────────────────╯
alias x='xmake'
alias xr='xmake -r && xmake r'
alias xt='xmake -r && xmake r -g test'
alias xb='xmake -r'





#  ╭──────────────────────────────────────────────────────────╮
#  │                          Cargo                           │
#  ╰──────────────────────────────────────────────────────────╯
alias C='cargo'
alias Cr='cargo run'
alias Crr='cargo run --release'
function Cn() { # Cargo new {project_name} && cd {project_name}
    if [ "$#" -ne 1 ]; then
        echo "Usage: Cn <project_name>"
        return 1
    fi
    cargo new $1 && cd $1
}
