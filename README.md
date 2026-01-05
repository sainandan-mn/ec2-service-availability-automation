# AWS EC2 Apache Auto-Healing Automation

## Overview

This project implements a lightweight automation to maintain service availability on an AWS EC2 instance. A Bash script continuously monitors a Linux service and automatically restarts it if it becomes unavailable.

Apache HTTP Server is used as a representative service, but the same approach can be applied to any systemd-managed service.

---

## Problem Statement

In real environments, services may stop due to:

* Instance reboots
* Configuration changes
* Resource or memory pressure
* Accidental human actions

Relying on manual recovery increases downtime and operational risk.

---

## Solution

A Bash script periodically checks the service state using `systemctl`. If the service is found inactive, it is restarted automatically and the recovery event is logged with a timestamp.

The script is executed on a fixed schedule using `cron`, allowing the system to recover without human intervention.

---

## Execution Flow

```
Cron (scheduled run)
   ↓
Monitoring script executes
   ↓
systemctl checks service state
   ↓
Service restarted if inactive
   ↓
Recovery event logged
```

---

## Technology Stack

* AWS EC2
* Ubuntu Linux (24.04 LTS)
* Bash
* Cron
* systemctl
* Apache HTTP Server (example service)

---

## Validation

The solution was validated by manually stopping the Apache service to simulate a failure. The automation detected the downtime, restarted the service, and recorded the recovery event in the log file.

---

## Use Case

This project demonstrates a simple but realistic infrastructure automation use case on AWS EC2. It focuses on service-level recovery for a single instance and is not a replacement for full monitoring or alerting systems.

The goal is to understand Linux service management, automation, and failure recovery in a cloud environment.

---

## High-Level Architecture

```
User Browser
   ↓
AWS EC2 (Ubuntu 24.04)
   ↓
Apache HTTP Server (Port 80)
   ↓
systemd service management
   ↓
Cron job (every 5 minutes)
   ↓
Bash monitoring script
   ↓
Apache restarted if inactive
   ↓
Recovery event logged
```

---

## Project Structure

```
aws-ec2-apache-auto-healing/
├── README.md              # Project documentation
├── check_service.sh   # Bash auto-healing script
├── cron.txt               # Cron job configuration
└── screenshots/           # Proof of execution
```

---

## Components Explained

### 1. Apache HTTP Server

* Runs on an Ubuntu EC2 instance
* Serves a simple web page on port 80
* Used as a representative Linux service

### 2. Auto-Healing Script (`scripts/check_service.sh`)

* Checks Apache service status using `systemctl`
* Restarts the service if it is not active
* Logs recovery events with timestamps
* Can be reused for any systemd-managed service

### 3. Cron Job (`cron.txt`)

* Runs the monitoring script every 5 minutes
* Enables continuous, unattended health checks
* Ensures recovery even if the service stops unexpectedly

---

## Screenshots

The `screenshots/` folder contains proof of execution:

* Apache service status
* Website availability
* Cron job configuration
* Auto-healing log output

---

## Key Learnings

* Linux service management using `systemctl`
* Bash scripting for automation
* Cron scheduling
* AWS EC2 fundamentals
* Basic infrastructure reliability concepts
* Failure detection and recovery workflows

---

## Author

**Sai Nandan**
Aspiring Cloud / DevOps Engineer

---
