# Fig pre block. Keep at the top of this file.
source $HOME/zsh/exports.zsh
source $HOME/zsh/alias.zsh
source $HOME/zsh/maps.zsh

[[ -f "$HOME/.fig/shell/zshrc.pre.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.pre.zsh"

# >>> xmake >>>
[[ -s "$HOME/.xmake/profile" ]] && source "$HOME/.xmake/profile" # load xmake profile
# <<< xmake <<<
go env -w GOPROXY="https://goproxy.cn"

# Fig post block. Keep at the bottom of this file.
[[ -f "$HOME/.fig/shell/zshrc.post.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.post.zsh"
### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

#启用 cd 命令的历史纪录，cd -[TAB]进入历史路径
setopt AUTO_PUSHD
#相同的历史路径只保留一个
setopt PUSHD_IGNORE_DUPS
# autoload compinit; compinit; zinit cdreplay -q

# Two regular plugins loaded without investigating.
zi ice wait lucid atload'_zsh_autosuggest_start'
zi light zsh-users/zsh-autosuggestions
zi light zdharma-continuum/fast-syntax-highlighting
zi light Tarrasch/zsh-command-not-found
zi ice depth=1; zinit light romkatv/powerlevel10k
# zinit ice depth=1;zinit light jeffreytse/zsh-vi-mode


# NOTE :
#  ╭──────────────────────────────────────────────────────────╮
#  │ Auto completion                                          │
#  ╰──────────────────────────────────────────────────────────╯

# NOTE: This setting can NOT be changed at runtime.:
zstyle ':autocomplete:*' widget-style menu-select
# # Up arrowzstyle ':autocomplete:*' widget-style complete-word
# complete-word: (Shift-)Tab inserts the top (bottom) completion.
# menu-complete: Press again to cycle to next (previous) completion.
# menu-select:   Same as `menu-complete`, but updates selection in menu.
zi light marlonrichert/zsh-autocomplete

bindkey '^p' up-line-or-search
# # Down arrow:
bindkey '^k' menu-select
bindkey '^n' menu-select
# up-line-or-search:  Open history menu.
# up-line-or-history: Cycle to previous history line.

# Return key in completion menu & history menu:
# .accept-line: Accept command line.
# accept-line:  Accept selection and exit menu.
# FIXME :
add-zsh-hook precmd recover-tab
recover-tab() {
    zstyle ':autocomplete:*' insert-unambiguous yes
}

#  ────────────────────────────────────────────────────────────

## History file configuration
HISTFILE="$HOME/.zsh_history"
HISTSIZE=50000
SAVEHIST=10000

#  ╭──────────────────────────────────────────────────────────╮
#  │  History command configuration                         │
#  ╰──────────────────────────────────────────────────────────╯
# setopt extended_history       # record timestamp of command in HISTFILE
setopt hist_expire_dups_first # delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt hist_ignore_dups       # ignore duplicated commands history list
setopt hist_ignore_space      # ignore commands that start with space
setopt hist_verify            # show command with history expansion to user before running it
setopt share_history          # share command history data
#       ────────────────────────────────────────────────────────────

### End of Zinit's installer chunk
# cursor mode
function zle-keymap-select {
    if [[ ${KEYMAP} == vicmd ]] || [[ $1 = 'block' ]]; then
        echo -ne '\e[1 q'
    elif [[ ${KEYMAP} == main ]] || [[ ${KEYMAP} == viins ]] || [[ ${KEYMAP} = '' ]] || [[ $1 = 'beam' ]]; then
        echo -ne '\e[5 q'
    fi
}

zle -N zle-keymap-select
echo -ne '\e[5 q'

preexec() {
    echo -ne '\e[5 q'
}

_fix_cursor() {
    echo -ne '\e[5 q'
}
precmd_functions+=(_fix_cursor)
KEYTIMEOUT=1
# eval "$(mcfly init zsh)"
# bind alias


# eval "$(thefuck --alias fuck)"
zi light QuarticCat/zsh-smartcache
source <(cod init $$ zsh)
eval "$(zoxide init zsh)"
# smartcache cod init $$ zsh
# smartcache eval zoxide init zsh
smartcache eval thefuck --alias fuck
