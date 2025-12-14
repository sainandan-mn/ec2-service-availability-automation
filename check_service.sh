#!/bin/bash

SERVICE_NAME="apache2"
LOG_FILE="/var/log/service_recovery.log"

if ! systemctl is-active --quiet "$SERVICE_NAME"; then
    systemctl restart "$SERVICE_NAME"
    echo "$(date '+%Y-%m-%d %H:%M:%S') - $SERVICE_NAME was down and restarted" >> "$LOG_FILE"
fi
