#!/bin/bash -e

install -v -d ${ROOTFS_DIR}/var/www/html/downloads
install -v -d ${ROOTFS_DIR}/var/www/html/images
install -v -d ${ROOTFS_DIR}/var/www/html/scripts
install -v -d ${ROOTFS_DIR}/var/www/html/styles/fonts

install -m 644 files/index.html ${ROOTFS_DIR}/var/www/html

mkdir -p files/downloads
wget -O files/downloads/promys.deb http://promys.me/downloads/promys.deb
wget -O files/downloads/promys.dmg http://promys.me/downloads/promys.dmg
wget -O files/downloads/promys.exe http://promys.me/downloads/promys.exe

install -m 644 files/downloads/promys.deb ${ROOTFS_DIR}/var/www/html/downloads/
install -m 644 files/downloads/promys.dmg ${ROOTFS_DIR}/var/www/html/downloads/
install -m 644 files/downloads/promys.exe ${ROOTFS_DIR}/var/www/html/downloads/

install -m 644 files/images/Apple.png   ${ROOTFS_DIR}/var/www/html/images/
install -m 644 files/images/bg.jpg      ${ROOTFS_DIR}/var/www/html/images/
install -m 644 files/images/Tux.png     ${ROOTFS_DIR}/var/www/html/images/
install -m 644 files/images/ubuntu.png  ${ROOTFS_DIR}/var/www/html/images/
install -m 644 files/images/Windows.png ${ROOTFS_DIR}/var/www/html/images/

install -m 644 files/scripts/platform.js ${ROOTFS_DIR}/var/www/html/scripts/platform.js
install -m 644 files/styles/style.css    ${ROOTFS_DIR}/var/www/html/styles/style.css

install -m 644 files/styles/fonts/Gruppo-Regular.ttf ${ROOTFS_DIR}/var/www/html/styles/fonts/Gruppo-Regular.ttf
