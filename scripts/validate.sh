#!/bin/bash
set -e

APP_URL="http://localhost:5000"
MAX_RETRIES=5
SLEEP_TIME=5

echo "Starting ValidateService: Checking Flask app status..."

for i in $(seq 1 $MAX_RETRIES); do
    if curl -s $APP_URL | grep -q "Please subscribe"; then
        echo "Flask app is running and validated."
        exit 0
    else
        echo "Attempt $i: App not ready yet. Retrying in $SLEEP_TIME seconds..."
        sleep $SLEEP_TIME
    fi
done

echo "Flask app validation failed!"
exit 1

