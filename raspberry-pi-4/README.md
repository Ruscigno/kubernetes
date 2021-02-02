## Required Hardware
- Raspberry Pi 4, with 4GB or 8GB RAM — the 4GB is the best value, 8GB is best if you don’t plan on doing clustering.
- SD card — 32GB recommended, but keep in mind that Kubernetes writes to disk a lot and it could kill a card.
- Power supply — you need the official supply or you can use PC Power Supply as I did.

## Flash OS
You can use [Raspebian](https://www.raspberrypi.org/software/) ([64bits](https://downloads.raspberrypi.org/raspios_arm64/images/)), [Ubuntu Server](https://ubuntu.com/download/raspberry-pi) or [Ubuntu Core](https://ubuntu.com/download/iot#core) (IOT optimized).

I would recommend you to install a 64b OS version..

Flash it to the SD card.

## Pre-requisites
- Change the password with `passwd pi` or `passwd ubuntu`.
- Run `raspi-config` and change the memory split to `16mb`, so that we have all the RAM for Kubernetes.
- I also recommend to disable HDMI to save more memory and probably lower the temperature in some components.

### Essential step
- Add the following to `/boot/cmdline.txt`, but make sure that you don’t add new lines.
`cgroup_enable=cpuset cgroup_memory=1 cgroup_enable=memory`
- Edit the file ./network-config and add your wi-fi credentials
