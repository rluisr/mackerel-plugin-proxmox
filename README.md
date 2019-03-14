mackerel-plugin-proxmox
=======================

Send LXC container metrics to Mackerel.  
Support Proxmox.

> This plugin is currently wip.

Supported metrics
-----------------

- [ ] CPU
  - CPU Use
  - CPU User Use
  - CPU System Use
- [x] Memory
  - Max allowed
  - Used
- [x] Network
  - IN
  - OUT
- [ ] Status

Screen shot
------------

![](https://files-uploader.xzy.pw/upload/20190310212747_4976434c48.png)

Install
-------

```
[plugin.metrics.lxc_memory]
command = "/root/mackerel-plugin-proxmox/memory.sh"

[plugin.metrics.lxc_network]
command = "/root/mackerel-plugin-proxmox/network.sh"
```

then restart mackerel-agent.
