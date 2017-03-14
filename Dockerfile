FROM alpine:3.5

MAINTAINER "The Ignorant IT Guy" <iitg@gmail.com>

# Make placeholder directories for the end user to mount against
RUN mkdir -p /var/log/iperf-server

RUN apk update \
  && apk add iperf \
  && rm -rf /var/cache/apk/*

# Expose the two testing ports
EXPOSE 5001/udp 5001/tcp

COPY run.sh /run.sh
RUN chmod +x /run.sh
ENTRYPOINT ["/run.sh"]
