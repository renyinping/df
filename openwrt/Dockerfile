# docker build --rm -t yinping/openwrt:18.06.8-arm64 .

FROM scratch

# wget -O openwrt-armvirt-64-default-rootfs.tar.gz https://downloads.openwrt.org/releases/18.06.8/targets/armvirt/64/openwrt-18.06.8-armvirt-64-default-rootfs.tar.gz
ADD openwrt-armvirt-64-default-rootfs.tar.gz /

USER root
EXPOSE 80
EXPOSE 22

# using exec format so that /sbin/init is proc 1 (see procd docs)
CMD ["/sbin/init"]