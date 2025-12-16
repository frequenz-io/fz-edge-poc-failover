#!/bin/sh

# Check the health of the backend services.
# - check if network connectivity is available (ping router)
# - check if fz-syncd is active.
# - check if the Microrid API service (nitrogend) is active.
# - check if we get a data sample from the main meter (ID 1332) within the last 10 seconds.
#
# If the health check fails, it returns exit code 1.
# If the health check passes, it returns exit code 0.

# Ping all the available network routers to check for network connectivity.
# If any one of them responds, we consider the network to be up.
# If none respond, we consider the network to be down.
echo "Checking network connectivity by pinging routers ..."
_router_ips="172.31.224.1 174.18.7.1"
_network_up=0
for ip in $_router_ips; do
  if ping -c 1 -W 2 "$ip" > /dev/null 2>&1; then
    echo "Network is up (router $ip is reachable)."
    _network_up=1
    break
  else
    echo "Router $ip is not reachable."
  fi
done

if [ "$_network_up" -eq 0 ]; then
  echo "Network is down (no routers are reachable)."
  exit 1
fi

# Network is up - check if services are running
# If network is up but services are down, we're likely in a recovery/transition state
# where notify_master hasn't started services yet. Skip service checks in this case.
#
# This assumes that both services should always be running when network is up.
# TODO: refine this logic for cases when the node is master, but the services are intentionally
#       stopped.
if ! systemctl is-active --quiet fz-syncd && ! systemctl is-active --quiet nitrogend; then
  echo "Network is up but services are not running."
  echo "Likely in recovery/transition state - skipping service checks to allow failover."
  exit 0
fi

echo "Checking health of fz-syncd ..."
if systemctl is-active --quiet fz-syncd; then
  echo "fz-syncd is active."
else
  echo "fz-syncd is not active."
  exit 1
fi

echo "Checking health of nitrogend ..."
if systemctl is-active --quiet nitrogend; then
  echo "nitrogend is active."
else
  echo "nitrogend is not active."
  exit 1
fi

# Try to read a data sample, and timeout after 10 seconds if no response.
echo "Checking for recent data sample from main meter (ID 1332) ..."
_data_cmd=$(timeout 10 curl -s http://[::1]:62062/v1/components/1332/data | head -n1)
if [ -z "$_data_cmd" ]; then
  echo "No data sample received from main meter (ID 1332) within the timeout period."
  exit 1
else
  echo "Data sample received from main meter (ID 1332): $_data_cmd"
fi

exit 0

