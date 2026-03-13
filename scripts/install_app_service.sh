#!/bin/bash
set -euo pipefail

APP_DIR="/opt/demo-app"
SOURCE_DIR="/tmp/app"
SERVICE_FILE="/etc/systemd/system/demo-app.service"

sudo mkdir -p "$APP_DIR"
sudo rm -rf "$APP_DIR"/*
sudo cp -r "$SOURCE_DIR"/* "$APP_DIR/"
sudo python3 -m pip install -r "$APP_DIR/requirements.txt"

cat <<'EOF' | sudo tee "$SERVICE_FILE" > /dev/null
[Unit]
Description=Demo Python App
After=network.target

[Service]
User=root
WorkingDirectory=/opt/demo-app
Environment=APP_ENV=production
ExecStart=/usr/bin/python3 /opt/demo-app/app.py
Restart=always

[Install]
WantedBy=multi-user.target
EOF

sudo systemctl daemon-reload
sudo systemctl enable demo-app
sudo systemctl restart demo-app
sudo systemctl status demo-app --no-pager
