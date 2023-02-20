#!/usr/bin/env zsh

# NOTE :
#                                 ╭─────────────╮
#                                 │ Insert mode │
#                                 ╰─────────────╯
# bindkey -e # for ctrl+a and ctrl+e
bindkey '^a' vi-beginning-of-line
bindkey '^e' vi-end-of-line
bindkey '^v' describe-key-briefly
bindkey '^j' vi-backward-char
bindkey '^b' vi-backward-word
bindkey '^o' vi-forward-char
bindkey '^f' vi-forward-word

bindkey -v 'j' vi-backward-char
bindkey -v 'b' vi-backward-word
bindkey -v 'o' vi-forward-char
bindkey -v 'f' vi-forward-word
