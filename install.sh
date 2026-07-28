#!/usr/bin/env bash

set -e

echo "================================="
echo "      PRIMEVPN Installer"
echo "================================="

apt update -y
apt install -y curl wget unzip git

cd /opt
rm -rf Prime-Core
git clone https://github.com/hadyshfayy126-alt/Prime-Core.git
cd Prime-Core

chmod +x x-ui x-ui.sh

bash x-ui.sh
