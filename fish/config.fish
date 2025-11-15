if status is-interactive
    # Commands to run in interactive sessions can go here
end


export GOPATH=$HOME/gowork
export GOBIN=$GOPATH/bin
export PATH="$HOME/.local/bin:$HOME/zsh/script:$HOME/.local/share/bob/nvim-bin:$HOME/.cargo/bin:$PATH"

starship init fish | source

# restore the sshkey in wsl2
if not set -q SSH_AUTH_SOCK
    ssh-agent -c | source
    ssh-add ~/.ssh/id_ed25519 2>/dev/null
end


zoxide init fish --cmd cd | source
source "$HOME/.config/fish/zoran/alias.fish"
source "$HOME/.config/fish/zoran/vimode.fish"
source "$HOME/.config/fish/zoran/fzf.fish"
