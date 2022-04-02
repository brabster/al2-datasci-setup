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
export PATH="~/.pyenv/bin:\$PATH"
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
 
setup_pyenv
install_python 3.8.13
python --version
