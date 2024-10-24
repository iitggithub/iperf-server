A docker container running an iperf server. You can use this to quickly and easily setup iperf servers around your organisation without having to install things... except docker.

# Supported Versions

iperf Version   | Git Tag    | Docker Tag
--------------  | ---------- | --------- 
3.17.1-r0       | master     | latest    
3.17.1-r0       | 3.17.1     | 3.17.1    
3.16-r0         | 3.16.0     | 3.16.0    
3.14-r0         | 3.14.0     | 3.14.0    
3.12-r1         | 3.12.0     | 3.12.0    
3.11-r1         | 3.11.0     | 3.11.0    
3.10.1-r1       | 3.10.1     | 3.10.1    
3.9-r1          | 3.9.0      | 3.9.0     
3.7-r2          | 3.7.0      | 3.7.0     
2.2.0-r0        | 2.2.0      | 2.2.0     
2.1.9-r0        | 2.1.9      | 2.1.9     
2.1.8-r0        | 2.1.8      | 2.1.8     
2.1.7-r0        | 2.1.7      | 2.1.7     
2.1.4-r0        | 2.1.4      | 2.1.4     
2.0.14a-r0      | 2.0.14a    | 2.0.14a   
2.0.13-r2       | 2.0.13     | 2.0.13

# Getting Started

iperf-server is actually iperf (version 2) and iperf3 (version 3) all rolled into one repository.

The easiest way to get started is to just run a docker container. The following will start an iperf3 server using the latest available version of Iperf3. Iperf3 servers by default will listen on TCP port 5201 and UDP port 5201. A unique name is used to differentiate iperf servers from one another.

```
docker run -d --restart=always --name iperf-server_5201 -p 5201:5201 -p 5201/udp:5201/udp  iitgdocker/iperf-server:latest
```

# Iperf Parameters

For more information on what parameters are supported by iperf or iperf3, it's best to view the official documentation located at [https://iperf.fr/iperf-doc.php](https://iperf.fr/iperf-doc.php) .

# Volumes

## Log files

By default, an iperf server will log to standard output. If you need to, you can mount directory against /data and add "-o /data/iperf.log" to the environment variable ARGS.

# Environment Variables


Variable                 | Default Value (docker-compose) | Description
------------------------ | ------------------------------ |------------
ARGS                     | unset                          | Arguments to be passed to the iperf command.
TCP_WINDOW_SIZE          | unset                          | iperf can use this to set the TCP window size. You can also do this using ARGS as well

# The End

If you have any comments, suggestions etc. Let me know.
