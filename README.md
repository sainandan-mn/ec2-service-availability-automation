# EC2 Service Availability Automation

## Overview
This project ensures a Linux service running on an AWS EC2 instance is automatically restored if it stops.
Apache HTTP Server is used as an example service.

## Why This Exists
Services can stop due to reboots, configuration changes, or human error.
Manual recovery increases downtime.

## How It Works
A Bash script checks the service status using systemctl.
If the service is not running, it restarts the service and logs the event.
The script runs automatically using cron.

## Flow
Cron (every 5 minutes)
→ Service check script
→ systemctl checks service
→ Service restarted if stopped
→ Event logged

## Tech Used
- AWS EC2
- Ubuntu Linux
- Bash
- Cron
- systemctl

## Validation
The service was stopped manually.
The script detected the issue, restarted the service, and logged the recovery
