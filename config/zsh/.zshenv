PATH="$HOME/.local/bin:$PATH"
PATH="$HOME/.cargo/bin:$PATH"
PATH="$HOME/gowork/bin:$PATH"
PATH=$PATH:$HOME/.local/share/bob/nvim-bin


PATH=$PATH:$HOME/zsh/script

eval "$(luarocks path)"
# Remove duplicate entries
export PATH=$(echo $PATH | tr ':' '\n' | awk '!a[$0]++' | paste -sd ':' -)
# export PATH=PATH
# export PATH=$PATH:$HOME/.yarn/bin

if [ -e /home/zoran/.nix-profile/etc/profile.d/nix.sh ]; then . /home/zoran/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
