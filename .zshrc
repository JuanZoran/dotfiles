# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
    source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source $HOME/zsh/exports.zsh
source $HOME/zsh/alias.zsh


go env -w GOPROXY="https://goproxy.cn"



source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

#启用 cd 命令的历史纪录，cd -[TAB]进入历史路径
setopt AUTO_PUSHD
#相同的历史路径只保留一个
setopt PUSHD_IGNORE_DUPS


zi light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-syntax-highlighting
source $HOME/zsh/highlight.zsh
source $HOME/zsh/maps.zsh

# NOTE :
#                               ╭─────────────────╮
#                               │ Auto completion │
#                               ╰─────────────────╯

# NOTE : This setting can NOT be changed at runtime.:
zstyle ':autocomplete:*' widget-style menu-select
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
source ~/.asdf/asdf.sh
# >>> xmake >>>
[[ -s "$HOME/.xmake/profile" ]] && source "$HOME/.xmake/profile" # load xmake profile
# <<< xmake <<<
