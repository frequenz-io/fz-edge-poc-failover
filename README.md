# Failover PoC

A high availability setup using keepalived for automatic failover between master and backup nodes.

## Overview

This project configures keepalived-based failover with health monitoring for backend services. The system automatically detects the architecture to assign master (aarch64) or backup (other architectures) roles.

## Prerequisites

- Linux-based system
- keepalived installed
- Sudo privileges for configuring keepalived

### Attention

Before running the next steps, please consider disabling and stopping keepalived if it is already running on your system to avoid surprises.

If you do disable and stop keepalived, remember to re-enable and start it after installation if needed.

## Installation

```bash
make install
```

This will:
- Install failover scripts to `/opt/frequenz/failover/scripts/`
- Install keepalived configuration to `/etc/keepalived/`
- Auto-detect architecture and install the appropriate config (master/backup)

## Components

- **keepalive/**: Keepalived configuration files for master and backup nodes
- **scripts/**: Backend health check and control scripts
- **notes/**: Network interface documentation

## Scripts

- `backend_check_health.sh`: Health monitoring for backend services
- `backend_start.sh`: Start backend service
- `backend_stop.sh`: Stop backend service
