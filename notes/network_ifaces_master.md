# Network Interfaces Configuration - Master

```
u58@jetson-FQZ-000888-116 ~> ip a
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN group default qlen 1
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo
       valid_lft forever preferred_lft forever
    inet6 ::1/128 scope host
       valid_lft forever preferred_lft forever
2: dummy0: <BROADCAST,NOARP> mtu 1500 qdisc noop state DOWN group default qlen 1000
    link/ether 66:43:85:fa:79:04 brd ff:ff:ff:ff:ff:ff
3: eth0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc pfifo_fast state UP group default qlen 1000
    link/ether 48:b0:2d:7a:a7:fe brd ff:ff:ff:ff:ff:ff
    inet 172.31.224.13/24 brd 172.31.224.255 scope global eth0
       valid_lft forever preferred_lft forever
    inet 192.168.254.10/24 brd 192.168.254.255 scope global eth0
       valid_lft forever preferred_lft forever
    inet6 fd00:1:0:74::1/96 scope global
       valid_lft forever preferred_lft forever
    inet6 fe80::4ab0:2dff:fe7a:a7fe/64 scope link
       valid_lft forever preferred_lft forever
4: eth1: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc mq state UP group default qlen 1000
    link/ether 00:07:32:af:29:31 brd ff:ff:ff:ff:ff:ff
    inet 172.18.7.13/24 brd 172.18.7.255 scope global eth1
       valid_lft forever preferred_lft forever
    inet6 fe80::207:32ff:feaf:2931/64 scope link
       valid_lft forever preferred_lft forever
5: eth2: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc mq state UP group default qlen 1000
    link/ether 00:07:32:af:29:32 brd ff:ff:ff:ff:ff:ff
    inet 169.254.27.80/16 brd 169.254.255.255 scope link eth2
       valid_lft forever preferred_lft forever
    inet 192.168.6.2/24 brd 192.168.6.255 scope global eth2
       valid_lft forever preferred_lft forever
    inet6 fe80::207:32ff:feaf:2932/64 scope link
       valid_lft forever preferred_lft forever
6: wg0: <POINTOPOINT,NOARP,UP,LOWER_UP> mtu 1420 qdisc noqueue state UNKNOWN group default qlen 1
    link/none
    inet6 fd00:1:0:ffff::bc/64 scope global
       valid_lft forever preferred_lft forever
8: wwan0: <POINTOPOINT,MULTICAST,NOARP,UP,LOWER_UP> mtu 1500 qdisc pfifo_fast state UNKNOWN group default qlen 1000
    link/none
    inet 10.42.167.160/26 scope global wwan0
       valid_lft forever preferred_lft forever
    inet6 2a01:599:141:6356:e0e8:e39c:9b13:8db6/64 scope global
       valid_lft forever preferred_lft forever
    inet6 fe80::1b59:d40b:f7c4:bf90/64 scope link stable-privacy
       valid_lft forever preferred_lft forever
9: nat64: <POINTOPOINT,MULTICAST,NOARP,UP,LOWER_UP> mtu 1500 qdisc pfifo_fast state UP group default qlen 500
    link/none
    inet6 fe80::620d:3c32:7214:7b89/64 scope link stable-privacy
       valid_lft forever preferred_lft forever
10: docker0: <NO-CARRIER,BROADCAST,MULTICAST,UP> mtu 1500 qdisc noqueue state DOWN group default
    link/ether 02:42:26:5d:7f:00 brd ff:ff:ff:ff:ff:ff
    inet 172.17.0.1/16 brd 172.17.255.255 scope global docker0
       valid_lft forever preferred_lft forever
    inet6 fe80::42:26ff:fe5d:7f00/64 scope link
       valid_lft forever preferred_lft forever
```
