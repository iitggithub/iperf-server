#! /bin/sh -e

# Force default type to tcp
TYPE="tcp"

# LOGFILE is defined. redirect all output to LOGFILE.
if [ -n "${LOGFILE}" ]
  then
  echo "Setting LOGFILE to ${LOGFILE}..."
  LOGFILE=">>${LOGFILE} 2>&1"
fi

# Starts the iperf server using an environment variable containing
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
    echo "Running UDP iperf server with args: ${CMDARGS}"
    /usr/bin/iperf ${CMDARGS} ${LOGFILE} && exit $?
    else
    echo "Running TCP iperf server with args: -s${CMDARGS}"
    /usr/bin/iperf -s ${CMDARGS} ${LOGFILE} && exit $?
  fi
fi

# By default this will start an TCP based iperf server running on port 5001
/usr/bin/iperf -s && exit $?
