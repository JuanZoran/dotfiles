zinit ice atinit="source $plug_conf/highlight.zsh"
zinit light zsh-users/zsh-syntax-highlighting

zinit wait lucid atload'_zsh_autosuggest_start' light-mode for \
    zsh-users/zsh-autosuggestions

zinit ice wait lucid
zinit load hlissner/zsh-autopair


zinit ice atinit="source $plug_conf/autocmp.zsh"
zinit light marlonrichert/zsh-autocomplete

zinit ice depth=1 atinit="source $plug_conf/vikey.zsh"
zinit light jeffreytse/zsh-vi-mode
