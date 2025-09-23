#!/bin/bash
set -e

echo "Installing dependencies..."
sudo yum update -y || sudo apt update -y

# Install Python3 if not present
if ! command -v python3 &>/dev/null; then
  echo "Python3 not found, installing..."
  sudo yum install -y python3 || sudo apt install -y python3
fi

echo "Dependencies installed successfully."

