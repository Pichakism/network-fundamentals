#!/bin/bash

ALLOWED_IP="192.168.1.10"

sudo ufw --force reset

sudo ufw default deny incoming
sudo ufw default allow outgoing

sudo ufw allow from $ALLOWED_IP to any port 22 proto tcp

sudo ufw allow 80/tcp
sudo ufw allow 443/tcp

sudo ufw --force enable

sudo ufw status verbose > firewall_rules.txt

echo "Firewall configured successfully."