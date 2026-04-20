List available kernels

```bash
ls /boot/vmlinuz-*
```

Set the default kernel

```bash
grubby --set-default /boot/vmlinuz-4.18.0-348.2.1.el8_5.x86_64
```

Reboot Server

```bash
reboot now
```
