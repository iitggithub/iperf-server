A docker container running an iperf server. You can use this to quickly and easily setup iperf servers around your organisation.

# Supported Versions

iperf Version | Git branch | Tag name
--------------| ---------- |---------
2.0.9         | master     | latest
2.0.9         | 2.0.9      | 2.0.9
3.1.3         | 3.1.3      | 3.1.3

# Getting Started

There's two ways to get up and running, the easy way and the hard way.

## The Hard Way (Standalone)

Fire up a single iperf server using the default iperf settings.

```
docker run -d --name iperf-server_tcp_5001 -v /data/iperf-server/logs:/var/log/iperf-server iitgdocker/iperf-server:latest
```

## The Easy Way (Docker Compose)

The github repo contains a docker-compose.yml you can use as a base. The docker-compose.yml is compatible with docker-compose 1.5.2+. Below is an example but you can always find the latest version on github.

```
tcp-5001:
  image: iitgdocker/iperf-server:latest
  ports:
    - "5001:5001"
  volumes:
    - /data/iperf-server/logs:/var/log/iperf-server
  #environment:
    #- ARGS="--format m --print_mss --nodelay"
    #- TCP_WINDOW_SIZE="43K"
tcp-5002:
  image: iitgdocker/iperf-server:latest
  ports:
    - "5002:5001"
  volumes:
    - /data/iperf-server/logs:/var/log/iperf-server
  #environment:
    #- ARGS="--format m --print_mss --nodelay"
    #- TCP_WINDOW_SIZE="43K"
tcp-5003:
  image: iitgdocker/iperf-server:latest
  ports:
    - "5003:5001"
  volumes:
    - /data/iperf-server/logs:/var/log/iperf-server
  #environment:
    #- ARGS="--format m --print_mss --nodelay"
    #- TCP_WINDOW_SIZE="43K"
tcp-5004:
  image: iitgdocker/iperf-server:latest
  ports:
    - "5004:5001"
  volumes:
    - /data/iperf-server/logs:/var/log/iperf-server
  #environment:
    #- ARGS="--format m --print_mss --nodelay"
    #- TCP_WINDOW_SIZE="43K"
tcp-5005:
  image: iitgdocker/iperf-server:latest
  ports:
    - "5005:5001"
  volumes:
    - /data/iperf-server/logs:/var/log/iperf-server
  #environment:
    #- ARGS="--format m --print_mss --nodelay"
    #- TCP_WINDOW_SIZE="43K"
udp-5001:
  image: iitgdocker/iperf-server:latest
  ports:
    - "5001:5001/udp"
  volumes:
    - /data/iperf-server/logs:/var/log/iperf-server
  environment:
    - ARGS=-u
    #- ARGS="--format m --print_mss --nodelay"
    #- TCP_WINDOW_SIZE="43K"
udp-5002:
  image: iitgdocker/iperf-server:latest
  ports:
    - "5002:5001/udp"
  volumes:
    - /data/iperf-server/logs:/var/log/iperf-server
  environment:
    - ARGS=-u
    #- ARGS="--format m --print_mss --nodelay"
    #- TCP_WINDOW_SIZE="43K"
udp-5003:
  image: iitgdocker/iperf-server:latest
  ports:
    - "5003:5001/udp"
  volumes:
    - /data/iperf-server/logs:/var/log/iperf-server
  environment:
    - ARGS=-u
    #- ARGS="--format m --print_mss --nodelay"
    #- TCP_WINDOW_SIZE="43K"
udp-5004:
  image: iitgdocker/iperf-server:latest
  ports:
    - "5004:5001/udp"
  volumes:
    - /data/iperf-server/logs:/var/log/iperf-server
  environment:
    - ARGS=-u
    #- ARGS="--format m --print_mss --nodelay"
    #- TCP_WINDOW_SIZE="43K"
udp-5005:
  image: iitgdocker/iperf-server:latest
  ports:
    - "5005:5001/udp"
  volumes:
    - /data/iperf-server/logs:/var/log/iperf-server
  environment:
    - ARGS=-u
    #- TCP_WINDOW_SIZE="43K"
```

# Volumes

## Log files

By default, an iperf server will log to standard output. If you need to, you can mount directory against /var/log/iperf-server and add "-o /var/log/iperf-server/iperf.log" to the environment variable ARGS.

# Environment Variables


Variable                 | Default Value (docker-compose) | Description
------------------------ | ------------------------------ |------------
ARGS                     | unset                          | Arguments to be passed to the iperf command.
TCP_WINDOW_SIZE          | unset                          | iperf can use this to set the TCP window size. You can also do this using ARGS as well

According to iperf --help, you can also set every single option using environment variables. ie IPERF_<long option name>, such as IPERF_BANDWIDTH. I prefer using ARGS personally.

# The End

If you have any comments, suggestions etc. Let me know.
