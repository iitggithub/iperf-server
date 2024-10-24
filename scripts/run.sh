#! /bin/sh

# Exit if any errors
set -e

# Initialise variables
iperfCMD=""
cmdArgs=""
iperfServerType="tcp" # Set default server type to TCP

# Determine which version of iperf to use based on what's installed
if command -v iperf3 >/dev/null 2>&1; then
    iperfCMD="iperf3"
elif command -v iperf >/dev/null 2>&1; then
    iperfCMD="iperf"
else
    echo "Error: Neither iperf3 nor iperf is installed." >&2
    exit 1
fi

# Determines the type of iperf server to start (TCP or UDP)
# and then adds any arguments from the docker ARGS environment variable
# as iperf server parameters
if [ -n "${ARGS}" ]; then
  for arg in ${ARGS}; do
    case "${arg}" in
      "-u")
        echo "setting udp listener..."
        iperfServerType="udp"
        cmdArgs="-u -s ${cmdArgs}"
        continue
      ;;
      "*")
        cmdArgs="${cmdArgs} ${arg}"
      ;;
    esac
  done
fi

# TCP server type should be prefixed with the -s parameter
# so it runs in server mode. No separate parameters are needed
# to explicitly run the server in TCP mode.
if [ "${iperfServerType}" = "tcp" ]; then
  cmdArgs="-s ${cmdArgs}"
fi

# Run the iperf server
echo "Running ${iperfServerType} ${iperfCMD} server with args: ${cmdArgs}"
exec "/usr/bin/${iperfCMD}" ${cmdArgs}
