#!/bin/bash
curl -s http://localhost:5000 | grep -q "Please subscribe" || exit 1
