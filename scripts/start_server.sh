#!/bin/bash
set -e

APP_DIR="/home/ec2-user/rapyder-app"
cd $APP_DIR

echo "Stopping any process on port 80..."
sudo fuser -k 80/tcp || true

echo "Starting Python HTTP server on port 80..."
nohup python3 -m http.server 80 > $APP_DIR/server.log 2>&1 &
