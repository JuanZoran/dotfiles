#!/usr/bin/env zsh

export ZVM_VI_SURROUND_BINDKEY='s-prefix'
export ZVM_READKEY_ENGINE=$ZVM_READKEY_ENGINE_NEX
export ZVM_VI_HIGHLIGHT_BACKGROUND=#89e051           # Hex value
export ZVM_VI_HIGHLIGHT_FOREGROUND=#1d202f           # Hex value

KEYTIMEOUT=1
function zvm_config () {
    ZVM_VI_INSERT_SURROUND_BINDKEY=s-prefix # zsh-vim-surround support
    ZVM_VI_INSERT_ESCAPE_BINDKEY='^S'
}

function zvm_after_lazy_keybindings() {
    zvm_bindkey vicmd "h" zvm_enter_insert_mode
    zvm_bindkey vicmd "H" zvm_insert_bol

    zvm_bindkey vicmd "i" up-line-or-history
    zvm_bindkey vicmd "k" down-line-or-history
    zvm_bindkey vicmd "j" vi-backward-char
    zvm_bindkey vicmd "l" vi-forward-char

    zvm_bindkey vicmd "J" vi-beginning-of-line
    zvm_bindkey vicmd "L" vi-end-of-line

    zvm_bindkey visual "j" backward-char
    zvm_bindkey visual "i" up-line
    zvm_bindkey visual "k" down-line
    # zvm_bindkey viins "^v" describe-key-briefly
}

zinit ice depth=1; zinit light jeffreytse/zsh-vi-mode
# NOTE :
#  ╭──────────────────────────────────────────────────────────╮
#  │  bindkey: 可以查看所有的键绑定                          │
#  ╰──────────────────────────────────────────────────────────╯
# bindkey <keystroke>: 基于按键查看 widgets
# bindkey <keystroke> <widget>: 绑定到已经有的 widgets 里面
# bindkey -s <keystroke> <keystroke>: 把 a 绑定到 b 快捷键上
# bindkey -M <keymap> <keystroke>: 绑定到具体模式
# bindkey -r <keystroke>: 删除
# bindkey -M <keymap> -r <keystroke>: 删除 Bindkey:
# zle -l 查看所有的widgets

# NOTE :
# ╭──────────────────────────────────────────────────────────╮
# │ 可以绑定的所有模式                                       │
# ╰──────────────────────────────────────────────────────────╯
# .safe
# command
# emacs
# isearch
# listscroll
# main
# menuselect
# vicmd
# viins
# viopp
# visual

# NOTE :zsh-vi-mode has done that
# cursor mode
# function zle-keymap-select {
#     if [[ ${KEYMAP} == vicmd ]] || [[ $1 = 'block' ]]; then
#         echo -ne '\e[1 q'
#     elif [[ ${KEYMAP} == main ]] || [[ ${KEYMAP} == viins ]] || [[ ${KEYMAP} = '' ]] || [[ $1 = 'beam' ]]; then
#         echo -ne '\e[5 q'
#     fi
# }

# NOTE :
#  ╭──────────────────────────────────────────────────────────╮
#  │ Ctrl + a         需要在对应的词上                        │
#  ╰──────────────────────────────────────────────────────────╯
# 1.  yes -> no
# 2.  on -> off
# 3.  true -> false
# 4.  T -> F
# 5.  + -> -
# 6.  ++ -> --
# 7.  == => !=
# 8.  !== => ===
# 9.  && => ||
# 10. and => or


# zle -N zle-keymap-select

# _fix_cursor() {
#     echo -ne '\e[5 q'
# }
# precmd_functions+=(_fix_cursor)
