#!/bin/bash
set -e
cd /home/ec2-user/flask-app
# Install python & venv
sudo yum install -y python3 python3-venv
python3 -m venv venv
source venv/bin/activate
pip install --upgrade pip
pip install -r requirements.txt
