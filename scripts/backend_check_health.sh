#!/bin/sh

# Check the health of the backend services.
# - check if fz-syncd is active.
# - check if the Microrid API service (nitrogend) is active.
# - check if we get a data sample from the main meter (ID 1332) within the last 10 seconds.
#
# If the health check fails, it returns exit code 1.
# If the health check passes, it returns exit code 0.

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

