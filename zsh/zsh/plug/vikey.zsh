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

function zvm_config () {
    # ZVM_INIT_MODE=sourcing # 不要延迟加载

    ZVM_VI_SURROUND_BINDKEY='s-prefix'
    ZVM_VI_HIGHLIGHT_BACKGROUND=#89e051           # Hex value
    ZVM_VI_HIGHLIGHT_FOREGROUND=#1d202f           # Hex value
}

local -A keys
# function jump() {
#     if [[ -z $VIM ]]; then BUFFER="cdi" fi
#     zle accept-line
# }

function load_ins_key(){
    # zle -N jump
    keys=(
        '^p' up-line-or-search
        '^I' menu-select
        '^v' describe-key-briefly
        '^o' accept-line
        '^y' accept-line
        # '^j' jump
    )

    set_keys viins
}

zvm_after_init_commands+=(load_ins_key)


function zvm_after_lazy_keybindings() {
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
}
