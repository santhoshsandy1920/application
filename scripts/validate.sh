#!/bin/bash
set -e

echo "Validating application..."
STATUS=$(curl -s -o /dev/null -w "%{http_code}" http://localhost)

if [ "$STATUS" -eq 200 ]; then
  echo "Validation successful - Application is running!"
  exit 0
else
  echo "Validation failed - Application not reachable."
  exit 1
fi

