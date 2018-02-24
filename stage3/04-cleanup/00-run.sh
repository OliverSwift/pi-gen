#!/bin/bash -e

[ "${ROOTFS_DIR}" = "" ] && exit

rm -rf ${ROOTFS_DIR}/usr/share/doc
rm -rf ${ROOTFS_DIR}/usr/share/man
rm -rf ${ROOTFS_DIR}/usr/share/man-db
rm -rf ${ROOTFS_DIR}/usr/share/sounds
rm -rf ${ROOTFS_DIR}/usr/share/X11
