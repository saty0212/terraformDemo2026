#!/bin/bash
set -euo pipefail

if [ "$#" -ne 2 ]; then
  echo "Usage: deploy_app.sh <host> <ssh_private_key_file>"
  exit 1
fi

HOST="$1"
KEY_FILE="$2"

chmod 600 "$KEY_FILE"

scp -o StrictHostKeyChecking=no -i "$KEY_FILE" -r app scripts/install_app_service.sh "ec2-user@$HOST:/tmp/"
ssh -o StrictHostKeyChecking=no -i "$KEY_FILE" "ec2-user@$HOST" "bash /tmp/install_app_service.sh"
