FROM alpine:3.5

MAINTAINER "The Ignorant IT Guy" <iitg@gmail.com>

# Make placeholder directories for the end user to mount against
RUN mkdir -p /data

RUN apk update \
  && apk add iperf=2.0.9-r0 \
  && rm -rf /var/cache/apk/*

# Expose the two testing ports
EXPOSE 5001/udp 5001/tcp

VOLUME ["/data"]

COPY run.sh /run.sh
RUN chmod +x /run.sh
ENTRYPOINT ["/run.sh"]
