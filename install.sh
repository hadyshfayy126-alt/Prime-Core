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

chmod +x x-ui.sh

echo "1" | bash x-ui.sh
