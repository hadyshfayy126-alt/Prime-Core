#!/usr/bin/env bash

set -e

echo "================================="
echo "     Prime-Core Installer"
echo "================================="

apt update -y
apt install -y curl wget git unzip

cd /tmp
rm -rf Prime-Core

git clone https://github.com/hadyshfayy126-alt/Prime-Core.git

cd Prime-Core

mkdir -p /usr/local/prime-core
cp -r ./* /usr/local/prime-core/
cd /usr/local/prime-core

chmod +x x-ui.sh
chmod +x x-ui
cp x-ui /usr/local/prime-core/x-ui
chmod +x /usr/local/prime-core/x-ui

bash x-ui.sh install
