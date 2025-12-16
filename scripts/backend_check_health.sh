#!/bin/sh

# Check the health of the backend services.
# - check if fz-syncd is active.
# - check if the Microrid API service (nitrogend) is active.
# - check if we get a data sample from the main meter (ID 1332) within the last 10 seconds.
#
# If the health check fails, it returns exit code 1.
# If the health check passes, it returns exit code 0.

# Grace period: Allow time for services to start after keepalived starts
# This prevents the chicken-egg problem where health checks fail before notify_master
# can start the services when a master node comes back online.
GRACE_PERIOD_SECONDS=40

# Check if keepalived was started recently (within grace period)
if systemctl is-active --quiet keepalived; then
  # Get keepalived process start time in seconds since epoch
  _keepalived_start=$(systemctl show keepalived -p ActiveEnterTimestampMonotonic --value)

  if [ -n "$_keepalived_start" ] && [ "$_keepalived_start" != "0" ]; then
    # Get current monotonic time in microseconds and convert to seconds
    _current_time=$(cat /proc/uptime | awk '{print $1}' | cut -d'.' -f1)

    # Convert keepalived start time from microseconds to seconds
    _keepalived_start_sec=$((_keepalived_start / 1000000))

    # Calculate uptime of keepalived
    _keepalived_uptime=$((_current_time - _keepalived_start_sec))

    if [ "$_keepalived_uptime" -lt "$GRACE_PERIOD_SECONDS" ]; then
      echo "Keepalived started ${_keepalived_uptime}s ago (grace period: ${GRACE_PERIOD_SECONDS}s)"
      echo "Skipping health checks during grace period to allow services to start."
      exit 0
    fi
  fi
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

