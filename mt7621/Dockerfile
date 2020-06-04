FROM yinping/ubuntu:18.04

USER openwrt

WORKDIR /home/openwrt

RUN wget https://downloads.openwrt.org/releases/18.06.7/targets/ramips/mt7621/openwrt-sdk-18.06.7-ramips-mt7621_gcc-7.3.0_musl.Linux-x86_64.tar.xz &&\
    xz -d openwrt-sdk-18.06.7-ramips-mt7621_gcc-7.3.0_musl.Linux-x86_64.tar.xz &&\
    tar -xf openwrt-sdk-18.06.7-ramips-mt7621_gcc-7.3.0_musl.Linux-x86_64.tar &&\
    mv openwrt-sdk-18.06.7-ramips-mt7621_gcc-7.3.0_musl.Linux-x86_64 sdk18.06

WORKDIR /home/openwrt/sdk18.06

RUN ./scripts/feeds update -a

WORKDIR /home/openwrt
