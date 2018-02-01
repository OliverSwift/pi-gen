#!/bin/bash -e

install -m 644 files/config.txt ${ROOTFS_DIR}/boot/
install -m 644 files/cmdline.txt ${ROOTFS_DIR}/boot/

install -m 755 files/rc.local   ${ROOTFS_DIR}/etc/rc.local

install -m 644 files/hosts ${ROOTFS_DIR}/etc/hosts
install -m 644 files/hostname ${ROOTFS_DIR}/etc/hostname
