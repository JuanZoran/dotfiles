set -e

exist() {
	type "$1" >/dev/null 2>&1
}

# 判断当前系统是否为ubuntu
if ! exist apt; then
	# installer由用户输入
	echo -e "Please input your package manager"
	read -r installer
	exit 1
else
	export installer='sudo apt -y install'
fi
# NOTE :install from packge manager
ensure_install=(
	git net-tools wget curl
)

# NOTE should check if should install
option_install=(
	exa zsh lazygit nodejs ripgrep tldr fzf
)



# install() {
# 	eval "${installer} $*"
# }

# install_basic() {
# 	install "${ensure_installed[@]}"
# }

# install_firefox() {
# 	if ! exist wget; then
# 		install wget
# 	fi

# 	wget -O /tmp/Firefox \
# 		'https://download.mozilla.org/?product=firefox-latest-ssl&os=linux64&lang=en-US&_gl=1*gyrtu3*_ga*MTk5MDc2NDg2NS4xNjcxMDE0OTg0*_ga_MQ7767QQQW*MTY3MTAxODA5MS4xLjEuMTY3MTAxODMyNy4wLjAuMA..'

# 	tar -xjf /tmp/Firefox
# 	sudo mv firefox /opt/firefox
# 	sudo ln -s /opt/firefox/firefox /usr/local/bin/firefox
# 	sudo wget https://raw.githubusercontent.com/mozilla/sumo-kb/main/install-firefox-linux/firefox.desktop -P /usr/local/share/applications

# 	echo -e 'Download Successfully!'
# 	echo -e 'Would you like uninstall native firefox?'
# 	read -r res
# 	if [[ ${res} == y ]]; then
# 		snap remove firefox
# 	fi
# }

# install_how2() {
# 	if exist how2; then
# 		echo -e "${green}You had installed how2....${done}"
# 	else
# 		wget how2terminal.com/how2.deb -P /tmp
# 		sudo dpkg -i /tmp/how2.deb
# 	fi
# }

# install_navi() {
# 	if exist navi; then
# 		echo -e "${green}You had installed navi....${done}"
# 	else
# 		if exist cargo; then
# 			cargo install --locked navi
# 		else
# 			echo -e "${green} Please install cargo first ${done}"
# 		fi
# 	fi
# }

# install_help() {
# 	install_navi && sudo ln -s $(which navi) /usr/bin/help
# }

# install_bat() {
# 	if exist batcat; then
# 		echo -e "${green}You had installed bat....${done}"
# 	else
# 		installer batcat
# 	fi
# }

# install_cat() {
# 	install_bat && sudo rm /bin/cat && sudo ln -s $(which batcat) /bin/cat
# }

# install_fanyi() {
# 	if exist fanyi; then
# 		echo -e "${green}You had installed fanyi....${done}"
# 	else
# 		sudo npm -g install fanyi
# 	fi
# }

# update-npm() {
# 	if ! exist npm; then
# 		installer npm
# 	fi
# 	sudo npm install -g n && sudo n latest && hash -r && sudo remove --purge npm
# }

# install_ls() {
# 	installer exa && sudo rm /usr/bin/ls && sudo ln -s $(which exa) /usr/bin/ls
# }

# install_chrome() {
# 	wget 'https://www.google.cn/chrome/thank-you.html?statcb=0&installdataindex=empty&defaultbrowser=0#' -O /tmp/chrome.deb
# 	sudo dpkg -i /tmp/chrome.deb
# }

# install_lazygit() {
# 	LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep '"tag_name":' | sed -E 's/.*"v*([^"]+)".*/\1/')
# 	curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
# 	sudo tar xf lazygit.tar.gz -C /usr/local/bin lazygit
# }
