#!/bin/bash -e

install -m 644 files/config.txt ${ROOTFS_DIR}/boot/
install -m 644 files/cmdline.txt ${ROOTFS_DIR}/boot/

install -m 755 files/rc.local   ${ROOTFS_DIR}/etc/rc.local

install -m 644 files/hosts ${ROOTFS_DIR}/etc/hosts
install -m 644 files/hostname ${ROOTFS_DIR}/etc/hostname

# Add wlan0 with static ip for dhcp
if (! grep wlan0 ${ROOTFS_DIR}/etc/dhcpcd.conf ) then
    echo "interface wlan0" >> ${ROOTFS_DIR}/etc/dhcpcd.conf
    echo "static ip_address=10.11.12.1/24" >> ${ROOTFS_DIR}/etc/dhcpcd.conf
fi

# Give hostapd the conf file
sed -i -e 's:#DAEMON_CONF="":DAEMON_CONF="/etc/hostapd/hostapd.conf":' ${ROOTFS_DIR}/etc/default/hostapd

# Make boot and root readonly
sed -i -e '/^BOOTDEV/s:defaults:ro,defaults:' ${ROOTFS_DIR}/etc/fstab
sed -i -e '/^ROOTDEV/s:defaults:ro,defaults:' ${ROOTFS_DIR}/etc/fstab
