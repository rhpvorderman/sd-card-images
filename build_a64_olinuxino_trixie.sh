#!/usr/bin/env bash

sudo docker build -t sd-images .
docker run \
-e U_BOOT_GIT_REV="v2026.04" \
-e ATF_GIT_REV="v2.14.0" \
--rm \
-v ./sd-images:/artifacts \
sd-images \
build-boot \
a64_olinuxino \
allwinner-a64 \
a64-alinuxino_defconfig \
aarch64-linux-gnu

docker run --rm -v /tmp/sd-images:/artifacts sd-images build-debian debian arm64 trixie
