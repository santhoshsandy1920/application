#!/bin/bash
set -e

APP_DIR="/home/ec2-user/flask-app"
VENV_DIR="$APP_DIR/venv"

echo "Starting BeforeInstall: Installing dependencies..."

cd $APP_DIR

# Install python3 if not installed
if ! command -v python3 &> /dev/null; then
    sudo yum install -y python3 python3-venv
fi

# Create virtual environment if it doesn't exist
if [ ! -d "$VENV_DIR" ]; then
    python3 -m venv venv
fi

# Activate virtual environment
source $VENV_DIR/bin/activate

# Upgrade pip and install dependencies
pip install --upgrade pip
pip install -r requirements.txt

echo "Dependencies installed successfully."

