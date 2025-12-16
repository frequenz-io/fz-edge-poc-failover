#!/bin/sh
set -e

# Stop the backend services
# - fz-syncd: config sync and service management daemon.
# - All services managed by fz-syncd. The list is present in a file at /etc/freqeunz directory.
# - nitrogen-gateway: HTTP API gateway for the Microgrid API gRPC service.

echo "Stopping fz-syncd ..."
systemctl disable fz-syncd
systemctl stop fz-syncd

echo "Stopping all services managed by fz-syncd ..."
_service_list=$(cat /etc/frequenz/cloud-sync/outputs/service_names.txt | tr '\n' ' ')
systemctl disable $_service_list
systemctl stop $_service_list

