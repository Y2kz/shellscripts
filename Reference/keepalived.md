 Installation
---

```bash
yum install keepalived
```

Configuration
---

>  <b> !!! IMPORTANT NOTE !!! </b> <br/>
Update `vrrp_instance` name  , `interface`, `virtual_router_id`, `auth_pass` , `virtual_ipaddress`

> The virtual_router_id in Keepalived is a unique identifier for a VRRP (Virtual Router Redundancy Protocol) instance, helping to distinguish between different virtual routers on the same network segment. It must be the same for all VRRP instances that share the same virtual IP address.


***MASTER***

```bash
$ cat keepalived.conf

!Configuration File for keepalived
vrrp_instance VI_1 {
    state MASTER
    interface ens37
    virtual_router_id 64
    priority 200
    advert_int 2
    authentication {
        auth_type PASS
        auth_pass 1234
    }
    virtual_ipaddress {
        10.0.0.10
    }
}
```


***STANDBY***

```bash
$ cat keepalived.conf

! Configuration File for keepalived
vrrp_instance VI_1 {
    state STANDBY
    interface ens37
    virtual_router_id 64
    priority 150
    advert_int 2
    authentication {
        auth_type PASS
        auth_pass 1234
    }
    virtual_ipaddress {
        10.0.0.10
    }
}
```

Start service , enable & test
---

In both server

```bash
systemctl enable keepalived
systemctl start keepalived
```

shutdown master and verify the switchover .