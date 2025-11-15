alias vim="nvim"
alias q="cd .."
alias f="fzf --bind 'enter:become(nvim {})'"
alias c='cd `dirname $(fzf)`'
alias rm='safe-rm'
alias ins='sudo pacman -S'
alias del="sudo pacman -Rns"
alias up='sudo pacman -Syu'

- () {
    cd -
}

mkcd () {
    mkdir -p "$@" && cd "$_"
}

