#!/bin/bash
set -e
cd /home/ec2-user/flask-app
source venv/bin/activate

# Kill old process if exists
pkill -f "python3 app.py" || true

# Start flask in background (port 5000)
nohup python3 app.py > flask.log 2>&1 &
