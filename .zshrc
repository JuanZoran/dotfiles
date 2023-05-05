# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
    source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

go env -w GOPROXY="https://goproxy.cn"

# Download Znap, if it's not there yet.
[[ -f ~/Git/zsh-snap/znap.zsh ]] ||
git clone --depth 1 -- \
    https://github.com/marlonrichert/zsh-snap.git ~/Git/zsh-snap

source ~/Git/zsh-snap/znap.zsh  # Start Znap

source $HOME/zsh/exports.zsh
source $HOME/zsh/highlight.zsh
source $HOME/zsh/alias.zsh
source $HOME/zsh/maps.zsh

# NOTE :
#                                ╭──────────────╮
#                                │ Pretty Theme │
#                                ╰──────────────╯
# # To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
# `znap prompt` makes your prompt visible in just 15-40ms!
znap prompt romkatv/powerlevel10k
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
# eval "$(starship init zsh)"


znap source marlonrichert/zsh-autocomplete

# `znap source` automatically downloads and starts your plugins.
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

znap source jeffreytse/zsh-vi-mode
znap source zsh-users/zsh-autosuggestions
znap source zsh-users/zsh-syntax-highlighting

# `znap eval` caches and runs any kind of command output for you.
znap eval zoxide 'zoxide init zsh --cmd cd'
znap eval thefuck 'thefuck --alias'


# `znap function` lets you lazy-load features you don't always need.
znap function _pyenv pyenv 'eval "$( pyenv init - --no-rehash )"'
compctl -K    _pyenv pyenv

# ======================================



# marlonrichert/zsh-autocomplete

# NOTE :
#  ╭──────────────────────────────────────────────────────────╮
#  │                        OMZ-plugin                        │
#  ╰──────────────────────────────────────────────────────────╯
# zi snippet OMZ::plugins/command-not-found/command-not-found.plugin.zsh
# zi snippet OMZ::plugins/thefuck/thefuck.plugin.zsh


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# >>> xmake >>>
test -f "/home/zoran/.xmake/profile" && source "/home/zoran/.xmake/profile"
# <<< xmake <<<

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
