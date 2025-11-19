alias vim="nvim"
alias q="cd .."
alias f="fzf --bind 'enter:become(nvim {})'"
alias c='cd `dirname $(fzf)`'
alias rm='safe-rm'
alias ins='sudo pacman -S'
alias del="sudo pacman -Rns"
alias up='sudo pacman -Syu'
alias nb='npm run build'
alias nt='npm run test'

- () {
    cd -
}

mkcd () {
    mkdir -p "$@" && cd "$_"
}

