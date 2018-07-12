#!/bin/bash -e

install -m 644 files/config.txt ${ROOTFS_DIR}/boot/
install -m 644 files/cmdline.txt ${ROOTFS_DIR}/boot/
install -m 644 files/info.txt ${ROOTFS_DIR}/boot/

install -m 755 files/rc.local   ${ROOTFS_DIR}/etc/rc.local

install -m 644 files/hosts ${ROOTFS_DIR}/etc/hosts
install -m 644 files/hostname ${ROOTFS_DIR}/etc/hostname

# Add wlan0 with static ip for dhcp
if (! grep wlan0 ${ROOTFS_DIR}/etc/dhcpcd.conf ) then
    echo "interface wlan0" >> ${ROOTFS_DIR}/etc/dhcpcd.conf
    echo "static ip_address=10.11.12.1/24" >> ${ROOTFS_DIR}/etc/dhcpcd.conf
fi

# Give hostapd the conf file
install -v -m 644 files/hostapd.conf  ${ROOTFS_DIR}/boot/wifi.cfg
sed -i -e 's:#DAEMON_CONF="":DAEMON_CONF="/boot/wifi.cfg":' ${ROOTFS_DIR}/etc/default/hostapd

# Make boot readwrite for all
sed -i -e '/^BOOTDEV/s:defaults:defaults,fmask=0000,dmask=0000:' ${ROOTFS_DIR}/etc/fstab

# Make root readonly
sed -i -e '/^ROOTDEV/s:defaults:defaults,ro,noload:' ${ROOTFS_DIR}/etc/fstab

# Make lighttpd log errors in /var/run/lighttpd/error.log
sed -i -e '/^server.errorlog/s:/var/log/:/var/run/:' ${ROOTFS_DIR}/etc/lighttpd/lighttpd.conf

# Enable CGI
ln -s ../conf-available/10-cgi.conf ${ROOTFS_DIR}/etc/lighttpd/conf-enabled/10-cgi.conf
