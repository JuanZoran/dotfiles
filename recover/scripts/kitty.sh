source ~/dotfiles/utility/color.sh
# INFO:install kitty
kitty_install ()
{
    curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin
    sudo ln -s ~/.local/kitty.app/bin/kitty /usr/bin/kitty
}

# kitty with fcitx5
kitty_with_fcitx5 ()
{
    env_var='
NPUT_METHOD DEFAULT=fcitx5
GTK_IM_MODULE DEFAULT=fcitx5
QT_IM_MODULE DEFAULT=fcitx5
XMODIFIERS DEFAULT=\@im=fcitx5
SDL_IM_MODULE DEFAULT=fcitx
GLFW_IM_MODULE=ibus'
    set_env="echo '${env_var}' >> /etc/environment"

    clear && echo -e "
    ${hl}${blue}
    Now Begin to Set Environment Variables for Kitty with fcitx5
        these environment variables will be set in ${red}/etc/environment ${done}:
            ${green}
        ${env_var}
            ${done}
        ${underline}Type y to continue or any other key to stop....${done}"
    read -r res
    if [[ $res == y ]]; then
        sudo bash -c "${set_env}"
        clear && echo -e "${green}Done!\n${blue}Would you like reboot now?${done}\n"
        read -r choice
            if [[ ${choice} == y ]]; then
                reboot
            fi
    else
        echo "Nothing was changed"
    fi
}


# INFO:set kitty as default terminal
kitty_as_default_terminal ()
{
    clear && printf 'Now Start to Install kitty as Default Terminal \n Please chose kitty number \n Type y to continue \n'
    sudo update-alternatives --install /usr/bin/x-terminal-emulator x-terminal-emulator /usr/bin/kitty 1
    sudo update-alternatives --config x-terminal-emulator
}
