#/bin/bash

set -euo pipefail

adduser tester
echo "tester  ALL=(ALL) NOPASSWD:ALL" | tee /etc/sudoers.d/tester
su - tester -c id
su - tester -c "mkdir -p /home/tester/Downloads"
