set -e
fix_apt()
{
    sudo mv /var/lib/dpkg/info /var/lib/dpkg/info_old 
    sudo mkdir /var/lib/dpkg/info
    sudo apt update && sudo apt -f install
    sudo mv /var/lib/dpkg/info/* /var/lib/dpkg/info_old
    sudo rm -rf /var/lib/dpkg/info
    sudo mv /var/lib/dpkg/info_old /var/lib/dpkg/info
}

fix_time()
{
    sudo apt-get update
 
    sudo apt-get install ntpdate
     
    sudo ntpdate time.windows.com
     
    sudo hwclock --localtime --systohc 
}
