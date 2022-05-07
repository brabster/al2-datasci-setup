#!/bin/bash
 
set -euo pipefail

PROFILE_PATH=~/.bashrc
BASEDIR=$(dirname "$0")
 
setup_pyenv () {
 
	if [ -d ~/.pyenv ]; then
		echo "pyenv already installed, skipping"
		return 0
	fi
 
	echo "Install pyenv..."
	curl https://pyenv.run | bash
 
	echo "Initialising pyenv..."
	echo "source ${BASEDIR}/pyenv_profile.sh" >> ${PROFILE_PATH}

	echo "Updated ${PROFILE_PATH}"
	cat ${PROFILE_PATH}
 
}
 
install_python () {
	version=$1
	echo "Install Python $version"
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
	sudo yum install -y code
}

sudo yum update -y

install_vscode
 
setup_pyenv

echo "Init pyenv for this shell"
export PS1=${PS1:-""}
source ${BASEDIR}/pyenv_profile.sh

install_python 3.8.13
python --version
 
 
