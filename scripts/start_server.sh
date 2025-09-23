#!/bin/bash
set -e

APP_DIR="/home/ec2-user/flask-app"
VENV_DIR="$APP_DIR/venv"
LOG_FILE="$APP_DIR/flask_app.log"

echo "Starting AfterInstall: Starting Flask app..."

cd $APP_DIR
source $VENV_DIR/bin/activate

# Kill old app.py process if exists
OLD_PID=$(pgrep -f "python3 $APP_DIR/app.py" || true)
if [ ! -z "$OLD_PID" ]; then
    echo "Stopping old Flask process: $OLD_PID"
    kill -9 $OLD_PID
fi

# Start Flask app in background
nohup python3 app.py > $LOG_FILE 2>&1 &

echo "Flask app started successfully. Logs: $LOG_FILE"
