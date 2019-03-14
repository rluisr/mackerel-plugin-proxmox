mackerel-plugin-proxmox
=======================

Send LXC container metrics to Mackerel.  
Support Proxmox.

Supported metrics
-----------------

- [x] CPU
  - CPU Use
  - CPU User Use
  - CPU System Use
- [x] Memory
  - Max allowed
  - Used
- [x] Network
  - IN
  - OUT
- [x] Status

Screen shot
------------

![](https://files-uploader.xzy.pw/upload/20190314231406_635a354853.png)

Install
-------

```yml
[plugin.metrics.lxc_status]
command = "/root/mackerel-plugin-proxmox/status.sh"

[plugin.metrics.lxc_cpu]
command = "/root/mackerel-plugin-proxmox/cpu.sh"

[plugin.metrics.lxc_memory]
command = "/root/mackerel-plugin-proxmox/memory.sh"

[plugin.metrics.lxc_disk]
command = "/root/mackerel-plugin-proxmox/disk.sh"

[plugin.metrics.lxc_network]
command = "/root/mackerel-plugin-proxmox/network.sh"
```

then restart mackerel-agent.
