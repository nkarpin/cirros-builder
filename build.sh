#!/usr/bin/env bash

BUILDROOT_VER="2015.05"
KERNEL_VER="3.13.0-85.129"
GRUB_VER="2.02~beta2-36ubuntu8"
OUTPUT_DIR="/tmp/images"
INPUT_DIR="/tmp/build"
ARCH="x86_64"
BASH_OPTS="-x"

# docker run --privileged -i -e "BUILDROOT_VER=${BUILDROOT_VER}" \
#            -e "KERNEL_VER=${KERNEL_VER}" \
#            -e "GRUB_VER=${GRUB_VER}" \
#            -e "ARCH=${ARCH}" \
#            -v "${OUTPUT_DIR}":/opt/images \
#            -v "${INPUT_DIR}":/opt/build \
#            -t ubuntu:14.04 bash "${BASH_OPTS}" -c "
#             cd /opt/build && ./bin/system-setup
#             apt-get install python -y
#             mkdir -p ../download
#             ln -snf ../download download
#             wget -P download http://buildroot.uclibc.org/downloads/buildroot-${BUILDROOT_VER}.tar.gz
#             tar -xvf download/buildroot-${BUILDROOT_VER}.tar.gz
#             ln -snf buildroot-${BUILDROOT_VER} buildroot
#             pushd buildroot
#             QUILT_PATCHES=./../patches-buildroot quilt push -a
#             popd
#             make ARCH=${ARCH} br-source
#             make ARCH=${ARCH} OUT_D=
#             ./bin/grab-kernels ${KERNEL_VER}"

docker run --privileged -i -v "${OUTPUT_DIR}":/opt/images \
           -v "${INPUT_DIR}":/opt/build \
           -t ubuntu:14.04 bash "${BASH_OPTS}" -c "
            cd /opt/build && ./bin/system-setup
            apt-get install python -y
            mkdir -p ../download
            ln -snf ../download download
            wget -P download http://buildroot.uclibc.org/downloads/buildroot-${BUILDROOT_VER}.tar.gz
            tar -xvf download/buildroot-${BUILDROOT_VER}.tar.gz
            ln -snf buildroot-${BUILDROOT_VER} buildroot
            pushd buildroot
            QUILT_PATCHES=./../patches-buildroot quilt push -a
            popd
            make ARCH=${ARCH} br-source
            make ARCH=${ARCH} OUT_D=/opt/images
            ./bin/grab-kernels ${KERNEL_VER}
            ./bin/grab-grub-efi ${GRUB_VER}
            ./bin/bundle -v --arch=${ARCH} /opt/images/rootfs.tar \
            download/kernel-${ARCH}.deb download/grub-efi-${ARCH}.tar.gz /opt/images"
