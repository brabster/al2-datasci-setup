#/bin/bash

set -euo pipefail

yum install -y shadow-utils sudo util-linux
adduser tester
echo "tester  ALL=(ALL) NOPASSWD:ALL" | tee /etc/sudoers.d/tester
su - tester -c id
