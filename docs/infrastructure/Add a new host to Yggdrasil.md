# Add a new host to Yggdrasil

## 1. Generate bootable USB with K3OS

- Enable docker service.
- Check disk where you want to burn the K3OS image:

```bash
# On Linux
sudo fdisk -l
# On Mac
diskutil list
```

- Generate bootable ISO:

```bash
./scripts/generate-k3os-iso.sh <arch> <disk_partition>
# Example for Linux
./scripts/generate-k3os-iso.sh arm64 /dev/sdb1
# Example for Mac
./scripts/generate-k3os-iso.sh amd64 /dev/disk2
```

## 2. Install K3OS on device

Boot new device with USB and select:

```bash
Config system with cloud-init file?  ----------------->  N
Authorize GitHub users to SSH?  ---------------------->  y
Comma separated list of GitHub users to authorize:  -->  pedrodotmc
Configura WiFi?  ------------------------------------->  N
Run as server or agent?  ----------------------------->  (1 for server, 2 for agent)
Token or cluster secret:  ---------------------------->  <CLUSTER_SECRET>/<NODE_TOKEN>
Continue?  ------------------------------------------->  y
```

Wait for device restarts and check IP address.

## 3. Configure static IP in the device

In the device, create file `/var/lib/connman/default.config` and put following content:

```ini
[service_eth0]
Type=ethernet
IPv4=<IP_ADDRESS>/255.255.255.0/<GATEWAY>
IPv6=off
Nameservers=1.1.1.1,1.0.0.1
```

where `IP_ADDRESS` will be the IP of the node.
