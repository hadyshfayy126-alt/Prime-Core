#!/usr/bin/env bash

set -e

echo "================================="
echo "     Prime-Core Installer"
echo "================================="

apt update -y
apt install -y curl wget git unzip

INSTALL_DIR="/usr/local/prime-core"

echo "[+] Preparing directory..."

rm -rf $INSTALL_DIR
mkdir -p $INSTALL_DIR

cd /tmp
rm -rf Prime-Core

echo "[+] Downloading Prime-Core..."

git clone https://github.com/hadyshfayy126-alt/Prime-Core.git

cp -r Prime-Core/* $INSTALL_DIR/

chmod +x $INSTALL_DIR/x-ui

ln -sf $INSTALL_DIR/x-ui /usr/local/bin/prime-core


echo "[+] Creating service..."

cat > /etc/systemd/system/prime-core.service <<EOF
[Unit]
Description=Prime-Core Panel Service
After=network.target

[Service]
Type=simple
WorkingDirectory=$INSTALL_DIR
ExecStart=/usr/local/bin/prime-core
Restart=always

[Install]
WantedBy=multi-user.target
EOF


systemctl daemon-reload
systemctl enable prime-core
systemctl restart prime-core


echo ""
echo "================================="
echo " Prime-Core Installed Successfully"
echo "================================="
echo ""

echo "Status:"
systemctl status prime-core --no-pager

echo ""
echo "Show settings:"
echo "/usr/local/bin/prime-core setting -show"
