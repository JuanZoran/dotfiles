function fish_user_key_bindings
    # Execute this once per mode that emacs bindings should be used in
    fish_default_key_bindings -M insert

    # Then execute the vi-bindings so they take precedence when there's a conflict.
    # Without --no-erase fish_vi_key_bindings will default to
    # resetting all bindings.
    # The argument specifies the initial mode (insert, "default" or visual).
    fish_vi_key_bindings --no-erase insert




    # all func support see: https://fishshell.com/docs/current/cmds/bind.html
    bind --mode insert ctrl-j backward-char
    bind --mode insert ctrl-b backward-bigword
    # FIXME : smart ctrl-l
    # bind --mode insert ctrl-l forward-char
    # bind --mode insert ctrl-f forward-bigword
    bind --mode insert ctrl-h beginning-of-line


    bind -M default j backward-char
    bind -M default l forward-char
    bind -M default i up-line
    bind -M default k down-line
    bind -M default J beginning-of-line
    bind -M default L end-of-line
    # bind -M default h --sets-mode insert




    # Emulates vim's cursor shape behavior
    # Set the normal and visual mode cursors to a block
    set fish_cursor_default block
    set fish_cursor_insert line
    set fish_cursor_replace_one underscore
    set fish_cursor_replace underscore
    set fish_cursor_external line
    set fish_cursor_visual block
end
