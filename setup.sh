#!/bin/bash
 
set -euo pipefail
 
setup_pyenv () {
 
	if [ -d ~/.pyenv ]; then
		echo "pyenv already installed, skipping"
		return 0
	fi
 
	echo "Install pyenv..."
	curl https://pyenv.run | bash
 
	echo "Initialising pyenv..."
	cat << EOF >> ~/.bashrc
 
#### pyenv support
export PATH="~/.pyenv/shims:~/.pyenv/bin:\$PATH"
eval "\$(pyenv init -)"
eval "\$(pyenv virtualenv-init -)"
#### done
 
EOF
 
}
 
install_python () {
	version=$1
	pyenv install $version 
	pyenv global $version
	pyenv rehash
}
 
install_vscode () {
 
	if yum list installed code; then 
		echo "VSCode already installed, skipping..."
		return 0
	fi
 
	sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'
    yum check-update
	sudo yum install code
}

sudo yum update -y

install_vscode
 
setup_pyenv
install_python 3.8.13
python --version
 
 
