#!/usr/bin/env zsh
# NOTE : Utility
local function set_keys() {
    local mode=$1
    for key value (${(kv)keys}); do
        zvm_bindkey $mode $key $value
    done
}

local function unset_key() {
    local mode=$1; shift 1
    local keys=("$@")
    for key ($keys); do
        bindkey -r -M $mode $key
    done
}

# # NOTE :zsh-vi-mode has done that
# export ZVM_CURSOR_STYLE_ENABLED=false
# function zle-keymap-select {
#     if [[ ${KEYMAP} == vicmd ]] || [[ $1 = 'block' ]]; then
#         echo -ne '\e[1 q'
#     elif [[ ${KEYMAP} == main ]] || [[ ${KEYMAP} == viins ]] || [[ ${KEYMAP} = '' ]] || [[ $1 = 'beam' ]]; then
#         echo -ne '\e[5 q'
#     fi
# }
# zle -N zle-keymap-select



# KEYTIMEOUT=1
function zvm_config () {
    ZVM_INSERT_MODE_CURSOR=$ZVM_CURSOR_BLINKING_BEAM
    # ZVM_NORMAL_MODE_CURSOR=$ZVM_CURSOR_BLINKING_BLOCK
    # ZVM_OPPEND_MODE_CURSOR=$ZVM_CURSOR_BLINKING_UNDERLINE

    ZVM_VI_INSERT_SURROUND_BINDKEY=s-prefix # zsh-vim-surround support
    ZVM_VI_INSERT_ESCAPE_BINDKEY='^S'
    ZVM_VI_SURROUND_BINDKEY='s-prefix'
    ZVM_READKEY_ENGINE=$ZVM_READKEY_ENGINE_NEX
    ZVM_VI_HIGHLIGHT_BACKGROUND=#89e051           # Hex value
    ZVM_VI_HIGHLIGHT_FOREGROUND=#1d202f           # Hex value
}

local -A keys

function load_ins_key () {
    keys=(
        '^p' up-line-or-search
        '^k' menu-select
        '^I' menu-select
        '^n' menu-select
        '^v' describe-key-briefly
        '^b' backward-word
        '^f' forward-word
    )
    set_keys viins
}
zvm_after_init_commands+=(load_ins_key)

function zvm_after_lazy_keybindings() {
    # Unbind key
    unset_key viopp \
        j k iW iw ia

    keys=(
        h zvm_enter_insert_mode
        H zvm_insert_bol

        i up-line-or-history
        k down-line-or-history
        j vi-backward-char
        l vi-forward-char
        J vi-beginning-of-line
        L vi-end-of-line
    )
    set_keys vicmd


    keys=(
        j backward-char
        k down-line
    )
    set_keys visual

    keys=(
        W select-in-blank-word
        w select-in-word
        j vi-backward-char
        l vi-forward-char
        i up-line
        k down-line
        J vi-beginning-of-line
        L vi-end-of-line
    )
    set_keys viopp
    # zvm_bindkey visual "i" up-line
    # unset_key visual \
        #     "i^["\
        #     "i "\
        #     "i\""\
        #     "i'"\
        #     "i("\
        #     "i)"\
        #     "i<"\
        #     "i>"\
        #     "iW"\
        #     "i["\
        #     "i]"\
        #     "i\`"\
        #     "ia"\
        #     "iw"\
        #     "i{"\
        #     "i}"
    # visual "h" zvm_readkeys_handler
    # visual "h^[" zvm_select_surround
    # visual "h " zvm_select_surround
    # visual "h\"" zvm_select_surround
    # visual "h'" zvm_select_surround
    # visual "h(" zvm_select_surround
    # visual "h)" zvm_select_surround
    # visual "h<" zvm_select_surround
    # visual "h>" zvm_select_surround
    # visual "hW" select-in-blank-word
    # visual "h[" zvm_select_surround
    # visual "h]" zvm_select_surround
    # visual "h\`" zvm_select_surround
    # visual "ha" select-in-shell-word
    # visual "hw" select-in-word
    # visual "h{" zvm_select_surround
    # visual "h}" zvm_select_surround
}

# # add-zsh-hook precmd recover-tab
zinit ice depth=1
zinit light jeffreytse/zsh-vi-mode


# # NOTE :
# #  ╭──────────────────────────────────────────────────────────╮
# #  │  bindkey: 可以查看所有的键绑定                          │
# #  ╰──────────────────────────────────────────────────────────╯
# # bindkey <keystroke>: 基于按键查看 widgets
# # bindkey <keystroke> <widget>: 绑定到已经有的 widgets 里面
# # bindkey -s <keystroke> <keystroke>: 把 a 绑定到 b 快捷键上
# # bindkey -M <keymap> <keystroke>: 绑定到具体模式
# # bindkey -r <keystroke>: 删除
# # bindkey -M <keymap> -r <keystroke>: 删除 Bindkey:
# # zle -l 查看所有的widgets

# # NOTE :
# # ╭──────────────────────────────────────────────────────────╮
# # │ 可以绑定的所有模式                                       │
# # ╰──────────────────────────────────────────────────────────╯
# # .safe
# # command
# # emacs
# # isearch
# # listscroll
# # main
# # menuselect
# # vicmd
# # viins
# # viopp
# # visual


# # NOTE :
# #  ╭──────────────────────────────────────────────────────────╮
# #  │ Ctrl + a         需要在对应的词上                        │
# #  ╰──────────────────────────────────────────────────────────╯
# # 1.  yes -> no
# # 2.  on -> off
# # 3.  true -> false
# # 4.  T -> F
# # 5.  + -> -
# # 6.  ++ -> --
# # 7.  == => !=
# # 8.  !== => ===
# # 9.  && => ||
# # 10. and => or

# # {}在zsh里被称为花括号，通常用于展开多个文件或文件夹的名称。例如，我们可以使用`touch file{1..3}.txt`命令来创建三个文件file1.txt、file2.txt和file3.txt。

# # ()表示子shell，它将命令序列包含在一个子进程中并执行它们。此外，它也可以用于分组命令和处理变量替换。例如，`(cd dir && command)`可以在子Shell中进入dir目录并执行command命令。

# # []通常用于条件测试。例如，`[ -e file.txt ]`可以检查当前目录下是否存在file.txt文件，如果存在，则返回true。另外，[]还可以用于文件名扩展。例如，`ls [abc]*.txt`将列出以a、b或c开头的所有txt文件。
