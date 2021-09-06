A docker container running an iperf server. You can use this to quickly and easily setup iperf servers around your organisation.

# Supported Versions

iperf Version | Git branch | Tag name
--------------| ---------- |---------
2.0.14a       | master     | latest
2.0.9         | 2.0.9      | 2.0.9
2.0.14a       | 2.0.14a    | 2.0.14a
3.1.3         | 3.1.3      | 3.1.3
3.10.1        | 3.10.1     | 3.10.1

# Getting Started

iperf-server is actually broken up into an iperf2-based server, and an iperf3-based server.

There's two ways to get up and running, the easy way and the hard way.

## The Hard Way (Standalone) for iperf2

Fire up a single iperf server using the default iperf settings.

```
docker run -d --name iperf-server_tcp_5001 -v /data/iperf-server/logs:/data iitgdocker/iperf-server:latest
```

## The Easy Way (Docker Compose) for iperf2

The github repo contains a docker-compose.yml you can use as a base. The docker-compose.yml is compatible with docker-compose 1.5.2+.

For iperf2 (latest), you can use docker-compose-iperf2.yml, and for iperf3 you can use docker-compose-iperf3.yml. These files are provided as a base to get you started so you may need to modify them to suit your specific use-case.

# Volumes

## Log files

By default, an iperf server will log to standard output. If you need to, you can mount directory against /data and add "-o /data/iperf.log" to the environment variable ARGS.

# Environment Variables


Variable                 | Default Value (docker-compose) | Description
------------------------ | ------------------------------ |------------
ARGS                     | unset                          | Arguments to be passed to the iperf command.
TCP_WINDOW_SIZE          | unset                          | iperf can use this to set the TCP window size. You can also do this using ARGS as well

According to iperf --help, you can also set every single option using environment variables. ie IPERF_<long option name>, such as IPERF_BANDWIDTH. I prefer using ARGS personally.

# The End

If you have any comments, suggestions etc. Let me know.
