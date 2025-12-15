# Network Interfaces Configuration - Backup

```
u58@fitlet-FQZ-001032-116 ~> ip a
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN group default qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo
       valid_lft forever preferred_lft forever
    inet6 ::1/128 scope host
       valid_lft forever preferred_lft forever
2: enp2s0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc mq state UP group default qlen 1000
    link/ether 00:01:c0:37:95:33 brd ff:ff:ff:ff:ff:ff
    inet 172.31.224.14/24 scope global enp2s0
       valid_lft forever preferred_lft forever
    inet6 fd00:1:0:74::2/96 scope global
       valid_lft forever preferred_lft forever
    inet6 fe80::201:c0ff:fe37:9533/64 scope link
       valid_lft forever preferred_lft forever
3: eno1: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc mq state UP group default qlen 1000
    link/ether 00:01:c0:37:96:ad brd ff:ff:ff:ff:ff:ff
    inet 169.254.40.233/16 brd 169.254.255.255 scope link eno1
       valid_lft forever preferred_lft forever
    inet 192.168.6.2/24 brd 192.168.6.255 scope global eno1
       valid_lft forever preferred_lft forever
    inet 172.18.7.14/24 brd 172.18.7.255 scope global eno1
       valid_lft forever preferred_lft forever
    inet6 fe80::201:c0ff:fe37:96ad/64 scope link
       valid_lft forever preferred_lft forever
4: wg0: <POINTOPOINT,NOARP,UP,LOWER_UP> mtu 1420 qdisc noqueue state UNKNOWN group default qlen 1000
    link/none
    inet6 fd00:1:0:ffff::bd/64 scope global
       valid_lft forever preferred_lft forever
6: eth0: <BROADCAST,MULTICAST> mtu 1500 qdisc noop state DOWN group default qlen 1000
    link/ether 7e:da:fc:5a:ec:d8 brd ff:ff:ff:ff:ff:ff
7: wlp1s0: <BROADCAST,MULTICAST> mtu 1500 qdisc noop state DOWN group default qlen 1000
    link/ether 74:04:f1:bc:f6:83 brd ff:ff:ff:ff:ff:ff
10: nat64: <POINTOPOINT,MULTICAST,NOARP,UP,LOWER_UP> mtu 1500 qdisc fq_codel state UP group default qlen 500
    link/none
    inet6 fe80::b24b:c2:2a8d:8dd1/64 scope link stable-privacy
       valid_lft forever preferred_lft forever
11: docker0: <NO-CARRIER,BROADCAST,MULTICAST,UP> mtu 1500 qdisc noqueue state DOWN group default
    link/ether 02:42:38:c2:b0:ee brd ff:ff:ff:ff:ff:ff
    inet 172.17.0.1/16 brd 172.17.255.255 scope global docker0
       valid_lft forever preferred_lft forever
12: wwan0: <POINTOPOINT,MULTICAST,NOARP,UP,LOWER_UP> mtu 1500 qdisc fq_codel state UNKNOWN group default qlen 1000
    link/none
    inet 10.44.53.189/30 scope global wwan0
       valid_lft forever preferred_lft forever
    inet6 2a01:599:141:4484:84c0:d42:26df:8636/64 scope global
       valid_lft forever preferred_lft forever
    inet6 fe80::836f:2619:5a82:a273/64 scope link stable-privacy
       valid_lft forever preferred_lft forever
```
