# alias -g NOTE  global works
# alias theme="alacritty-colorscheme"
alias vim="nvim"
alias vi="nvim"
alias qt="qtcreator&"
alias qtc="cd ~/Qt-Code&"
alias py="python3"
alias gn="cd /home/zoran/notes"
alias open="nautilus ."
alias quit="exit"
alias q="cd .."
alias p='show.zsh -p'
alias s='show.zsh'
alias S='show.zsh -s'
alias g='git'
alias grep='rg'
alias e='exit'
alias f='fanyi'
alias format='cp ~/dotfiles/config/clangd/.clang-format .'
alias a="ranger"
alias aa="lazygit"
alias lk="du -sh * | sort -h"
alias ll="exa --tree --level=2 -a --long --header --accessed"
alias win="sudo dpkg-reconfigure lightdm"
alias x="xmake"
alias gb="git checkout"
alias gg="git clone --depth=1"
alias lua="luajit"

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


# safe rm
alias rm='trash'
alias rl='trashlist'
alias ur='undelfile'
#替换rm指令移动文件到~/.trash/中
trash()
{
   mv $@  ~/.trash/
}
#显示回收站中垃圾清单
trashlist()
{
   echo -e "33[32m==== Garbage Lists in ~/.trash/ ====33[0m"
   echo -e "\a33[33m----Usage------33[0m"
   echo -e "\a33[33m-1- Use 'cleartrash' to clear all garbages in ~/.trash!!!33[0m"
   echo -e "\a33[33m-2- Use 'ur' to mv the file in garbages to current dir!!!33[0m"
   ls -al  ~/.trash
}
#找回回收站相应文件
undelfile()
{
   mv -i ~/.trash/$@ ./
}
#清空回收站
cleartrash()
{
   echo -ne "\a33[33m!!!Clear all garbages in ~/.trash, Sure?[y/n]33[0m"
   read confirm
   if [ $confirm == 'y' -o $confirm == 'Y' ] ;then
      /bin/rm -rf ~/.trash/*
      /bin/rm -rf ~/.trash/.* 2>/dev/null
   fi
}

- () {
    cd -
}

mkcd () {
    mkdir -p "$@" && cd "$_"
}
