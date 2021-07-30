#! /bin/sh -e

# Force default type to tcp
TYPE="tcp"

# Starts the iperf3 server using an environment variable containing
# command line arguments to be passed to the server.
if [ -n "${ARGS}" ]
  then
  for i in ${ARGS}
    do
    case ${i} in
      "-u")
      echo "setting udp listener..."
      TYPE="udp"
      CMDARGS="-u -s ${CMDARGS}"
      continue
      ;;
    esac
    CMDARGS="${CMDARGS} ${i}"
  done
  if [ ${TYPE} == "udp" ]
    then
    echo "Running UDP iperf3 server with args: ${CMDARGS}"
    /usr/bin/iperf3 ${CMDARGS} && exit $?
    else
    echo "Running TCP iperf3 server with args: -s${CMDARGS}"
    /usr/bin/iperf3 -s ${CMDARGS} && exit $?
  fi
fi

# By default this will start an TCP based iperf3 server running on port 5001
/usr/bin/iperf3 -s && exit $?
