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

# function which can create a new hexo file and open it in vim
nn () {
    if [ -z "$1" ]; then
        echo "Please enter a title for the new post"
    else
        touch $BLOG/source/_posts/$1.md
        echo "---" >> $BLOG/source/_posts/$1.md
        echo "title: $1" >> $BLOG/source/_posts/$1.md
        echo "date: $(date +%Y-%m-%d\ %H:%M:%S)" >> $BLOG/source/_posts/$1.md
        echo "tags: " >> $BLOG/source/_posts/$1.md
        echo "---" >> $BLOG/source/_posts/$1.md
        vim $BLOG/source/_posts/$1.md
    fi
}
