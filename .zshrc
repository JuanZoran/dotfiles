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

source $HOME/zsh/exports.zsh
source $HOME/zsh/highlight.zsh
source $HOME/zsh/alias.zsh
source $HOME/zsh/maps.zsh
zinit light jeffreytse/zsh-vi-mode


ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#ff00ff,bg=cyan,bold"
zi lucid light-mode for \
    atload"_zsh_autosuggest_start" \
    zsh-users/zsh-autosuggestions \
    atinit"zicompinit; zicdreplay" \
    zsh-users/zsh-syntax-highlighting \
    blockf atpull'zinit creinstall -q .' \
    zsh-users/zsh-completions


# NOTE :
#                                ╭──────────────╮
#                                │ Pretty Theme │
#                                ╰──────────────╯
# # To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
# zi ice depth=1; zinit light romkatv/powerlevel10k
zi light romkatv/powerlevel10k
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


# NOTE :
#  ╭──────────────────────────────────────────────────────────╮
#  │                        OMZ-plugin                        │
#  ╰──────────────────────────────────────────────────────────╯
zi snippet OMZ::plugins/command-not-found/command-not-found.plugin.zsh


eval "$(zoxide init zsh --cmd cd)"
eval $(thefuck --alias)

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion



### End of Zinit's installer chunk
# eval "$(starship init zsh)"
# >>> xmake >>>
test -f "/home/zoran/.xmake/profile" && source "/home/zoran/.xmake/profile"
# <<< xmake <<<