#!/bin/sh
set -e

# Start the backend services
# - fz-syncd: config sync and service management daemon.
# - nitrogen-gateway: HTTP API gateway for the Microgrid API gRPC service.

echo "Starting fz-syncd ..."
systemctl enable fz-syncd
systemctl start fz-syncd

echo "Starting nitrogen-gateway ..."
systemctl enable nitrogen-gateway
systemctl start nitrogen-gateway
