# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# alias -g NOTE  global works

alias theme="alacritty-colorscheme"
eval "$(thefuck --alias fuck)"
alias vim="nvim"
alias vi="nvim"
alias qt="qtcreator&"
alias cd="z"
alias j="z"
alias qtc="cd ~/Qt-Code&"
alias py="python3"
alias gn="cd /home/zoran/notes"
alias open="nautilus ."
alias quit="exit"
alias q=".."
alias p='show.zsh -p'
alias s='show.zsh'
alias S='show.zsh -s'
alias g='git'
alias grep='rg'
alias e='exit'
alias f='fanyi'
alias format='cp ~/dotfiles/config/clangd/.clang-format .'
alias a="ranger"
alias lg="lazygit"
alias lk="du -sh * | sort -h"
alias ll="exa --tree --level=2 -a --long --header --accessed"
alias win="sudo dpkg-reconfigure lightdm"
alias x="xmake"
alias gb="git checkout"
alias gg="git clone --depth=1"

alias la='luajit'
alias icat="kitty +kitten icat"
alias d="kitty +kitten diff"
alias ssh="kitty +kitten ssh"
alias ins="sudo apt -y install"
alias up="sudo apt update && sudo apt -y upgrade && sudo apt autoremove"
alias cl="sudo apt autoremove"
alias bench="hyperfine"
alias kup="curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin"
alias del="sudo apt remove --auto-remove"
