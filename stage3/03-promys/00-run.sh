#!/bin/bash -e

install -v -d ${ROOTFS_DIR}/opt/promys
install -m 755 files/promys     ${ROOTFS_DIR}/opt/promys/
install -m 644 files/splash.jpg ${ROOTFS_DIR}/opt/promys/
