FROM yinping/ubuntu:18.04

USER openwrt

WORKDIR /home/openwrt
RUN wget https://downloads.openwrt.org/releases/18.06.8/targets/ramips/mt7621/openwrt-sdk-18.06.8-ramips-mt7621_gcc-7.3.0_musl.Linux-x86_64.tar.xz &&\
    xz -d openwrt-sdk-18.06.8-ramips-mt7621_gcc-7.3.0_musl.Linux-x86_64.tar.xz &&\
    tar -xf openwrt-sdk-18.06.8-ramips-mt7621_gcc-7.3.0_musl.Linux-x86_64.tar &&\
    mv openwrt-sdk-18.06.8-ramips-mt7621_gcc-7.3.0_musl.Linux-x86_64 sdk18.06 &&\
    rm -rf openwrt-sdk-18.06.8-ramips-mt7621_gcc-7.3.0_musl.Linux-x86_64.tar

WORKDIR /home/openwrt/sdk18.06
RUN ./scripts/feeds update -a

WORKDIR /home/openwrt
RUN wget https://downloads.openwrt.org/releases/18.06.8/targets/ramips/mt7621/openwrt-imagebuilder-18.06.8-ramips-mt7621.Linux-x86_64.tar.xz &&\
    xz -d openwrt-imagebuilder-18.06.8-ramips-mt7621.Linux-x86_64.tar.xz &&\
    tar -xf openwrt-imagebuilder-18.06.8-ramips-mt7621.Linux-x86_64.tar &&\
    mv openwrt-imagebuilder-18.06.8-ramips-mt7621.Linux-x86_64 img18.06 &&\
    rm -rf openwrt-imagebuilder-18.06.8-ramips-mt7621.Linux-x86_64.tar

WORKDIR /home/openwrt/img18.06
RUN mkdir -p files &&\
    make image PROFILE=d-team_newifi-d2 \
        PACKAGES="-dnsmasq dnsmasq-full -wpad-mini wpad luci-i18n-base-zh-cn luci-i18n-firewall-zh-cn zerotier ttyd" \
        FILES=files/

WORKDIR /home/openwrt
