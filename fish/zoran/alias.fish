# alias -g NOTE  global works
alias vim="nvim"
alias vi="nvim"
alias py="python3"

alias open="nautilus ."
alias q="cd .."
alias g='git'
alias gb="git checkout"
alias gg="git clone --depth=1"
alias ls='exa'
alias ll="exa --tree --level=2 -a --long --header --accessed"

alias ins="sudo apt -y install"
alias cl="sudo apt autoclean && sudo apt autoremove"
alias up="sudo apt update && sudo apt -y upgrade && cl"
alias del="sudo apt remove --auto-remove"

alias format='cp ~/dotfiles/config/clangd/.clang-format .'
alias f="fzf --bind 'enter:become(nvim {})'"

# cd fzf result dir
alias c='cd `dirname $(fzf)`'

# # safe rm
alias rm='safe-rm'

# mkcd () {
#     mkdir -p "$@" && cd "$_"
# }

#  ╭──────────────────────────────────────────────────────────╮
#  │                       Xmake Alias                        │
#  ╰──────────────────────────────────────────────────────────╯
alias x='xmake'
alias xr='xmake -r && xmake r'
alias xt='xmake -r && xmake r -g test'
alias xb='xmake -r'
