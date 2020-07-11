if [ ! -e openwrt-armvirt-64-default-rootfs.tar.gz ]
then
    wget -O openwrt-armvirt-64-default-rootfs.tar.gz https://downloads.openwrt.org/releases/18.06.8/targets/armvirt/64/openwrt-18.06.8-armvirt-64-default-rootfs.tar.gz
fi

docker build --rm -t yinping/openwrt:18.06.8-arm64 .