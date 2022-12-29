echo -e "If you want to improve your grub speed"
echo -e "you can set /etc/default/grub"
echo -e "GRUB_TIMEOUT = 3"
echo -e "then [sudo update-grub]"


zsh_switch ()
{
    chsh -s /bin/zsh
    echo -e "Now you need to reboot"
    # TODO: reboot
}
