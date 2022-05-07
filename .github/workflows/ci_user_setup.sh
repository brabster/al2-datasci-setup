#/bin/bash

set -euo pipefail

yum install -y shadow-utils sudo util-linux tar git
adduser tester
echo "tester  ALL=(ALL) NOPASSWD:ALL" | tee /etc/sudoers.d/tester
su - tester -c id
su - tester -c "mkdir -p /home/tester/Downloads"
