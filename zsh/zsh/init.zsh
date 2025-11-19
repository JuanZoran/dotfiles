if command -v mise &> /dev/null; then
    eval "$(mise activate bash)"
fi

if command -v oh-my-posh &> /dev/null; then
    eval "$(oh-my-posh init zsh --config sim-web)"
fi

# if command -v starship &> /dev/null; then
#   eval "$(starship init zsh)"
# fi

if command -v zoxide &> /dev/null; then
    eval "$(zoxide init zsh)"
fi

# LuaRocks Path Configuration
eval "$(luarocks path --bin)"
