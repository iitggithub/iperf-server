#! /bin/sh -e

TYPE="tcp"

# Starts the iperf server using an environment variable containing
# command line arguments to be passed to the server.
if [ -n "${ARGS}" ]
  then
#  for i in ${ARGS}
#    do
#    case ${i} in
#      "-u":
#      TYPE="udp"
#      ;;
#      /5[0-9]{3}/:
#        PORT="${i}"
#      ;;
#    esac
#  done
  /usr/bin/iperf -s ${ARGS}
fi

# By default this will start an TCP based iperf server running on port 5001
/usr/bin/iperf -s
