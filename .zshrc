# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
    source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

go env -w GOPROXY="https://goproxy.cn"

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


# 启用 cd 命令的历史纪录，cd -[TAB]进入历史路径
setopt AUTO_PUSHD
#相同的历史路径只保留一个
setopt PUSHD_IGNORE_DUPS
# 禁用终端响铃
unsetopt BEEP
# 加强版通配符
setopt EXTENDED_GLOB
# 如果连续输入的命令相同，历史纪录中只保留一个
setopt HIST_IGNORE_DUPS
# 多个 zsh 间分享历史纪录
setopt SHARE_HISTORY


source $HOME/zsh/exports.zsh
source $HOME/zsh/highlight.zsh
source $HOME/zsh/alias.zsh
source $HOME/zsh/maps.zsh

zi light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-syntax-highlighting
# NOTE :
#  ╭──────────────────────────────────────────────────────────╮
#  │                        OMZ-plugin                        │
#  ╰──────────────────────────────────────────────────────────╯
zi snippet OMZ::plugins/command-not-found/command-not-found.plugin.zsh
# zi snippet OMZ::plugins/thefuck/thefuck.plugin.zsh

# NOTE :
#                               ╭─────────────────╮
#                               │ Auto completion │
#                               ╰─────────────────╯

# NOTE: This setting can NOT be changed at runtime.:
zstyle ':autocomplete:*' widget-style menu-select
zstyle ':autocomplete:*' insert-unambiguous yes
# # Up arrowzstyle ':autocomplete:*' widget-style complete-word
# complete-word: (Shift-)Tab inserts the top (bottom) completion.
# menu-complete: Press again to cycle to next (previous) completion.
# menu-select:   Same as `menu-complete`, but updates selection in menu.
zi light marlonrichert/zsh-autocomplete

#  ────────────────────────────────────────────────────────────
## History file configuration
HISTFILE="$HOME/.zsh_history"
HISTSIZE=50000
SAVEHIST=10000

#  ╭──────────────────────────────────────────────────────────╮
#  │  History command configuration                         │
#  ╰──────────────────────────────────────────────────────────╯
# setopt extended_history       # record timestamp of command in HISTFILE
setopt nonomatch
setopt hist_expire_dups_first # delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt hist_ignore_dups       # ignore duplicated commands history list
setopt hist_ignore_space      # ignore commands that start with space
setopt hist_verify            # show command with history expansion to user before running it
setopt share_history          # share command history data
#       ────────────────────────────────────────────────────────────

### End of Zinit's installer chunk
# NOTE :
#                                ╭──────────────╮
#                                │ Pretty Theme │
#                                ╰──────────────╯
# # To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
zi ice depth=1; zinit light romkatv/powerlevel10k
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
# eval "$(starship init zsh)"

eval "$(zoxide init zsh --cmd cd)"
eval $(thefuck --alias)

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# >>> xmake >>>
test -f "/home/zoran/.xmake/profile" && source "/home/zoran/.xmake/profile"
# <<< xmake <<<
