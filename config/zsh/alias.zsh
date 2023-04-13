# alias -g NOTE  global works
alias vim="nvim"
alias vi="nvim"
alias py="python3"
alias gn="cd /home/zoran/notes"
alias open="nautilus ."
alias quit="exit"
alias q="cd .."
alias g='git'
alias grep='rg'
alias e='exit'
alias format='cp ~/dotfiles/config/clangd/.clang-format .'
alias a="ranger"
alias aa="lazygit"
alias lk="du -sh * | sort -h"
alias ll="exa --tree --level=2 -a --long --header --accessed"
alias win="sudo dpkg-reconfigure lightdm"
alias x="xmake"
alias xr="xmake -r && xmake r"
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

alias f='nvim $(fzf)'

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

