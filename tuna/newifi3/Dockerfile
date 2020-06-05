FROM ubuntu:18.04

USER root

RUN mv /etc/apt/sources.list /etc/apt/sources.list-bak &&\
    echo 'deb http://mirrors.tuna.tsinghua.edu.cn/ubuntu/ bionic main restricted universe multiverse' > /etc/apt/sources.list &&\
    echo 'deb http://mirrors.tuna.tsinghua.edu.cn/ubuntu/ bionic-updates main restricted universe multiverse' >> /etc/apt/sources.list &&\
    echo 'deb http://mirrors.tuna.tsinghua.edu.cn/ubuntu/ bionic-backports main restricted universe multiverse' >> /etc/apt/sources.list &&\
    echo 'deb http://mirrors.tuna.tsinghua.edu.cn/ubuntu/ bionic-security main restricted universe multiverse' >> /etc/apt/sources.list &&\
    apt-get update &&\
    apt-get install -y sudo vim nano curl wget \
        git subversion gawk gettext zip unzip \
        build-essential ccache libncurses5-dev zlib1g-dev libssl-dev xsltproc \
        python python3 file flex &&\
    apt-get clean &&\
    useradd -m openwrt &&\
    echo 'openwrt ALL=NOPASSWD: ALL' > /etc/sudoers.d/openwrt

USER openwrt
WORKDIR /home/openwrt

RUN wget https://mirrors.tuna.tsinghua.edu.cn/openwrt/releases/18.06.8/targets/ramips/mt7621/openwrt-imagebuilder-18.06.8-ramips-mt7621.Linux-x86_64.tar.xz &&\
    xz -d openwrt-imagebuilder-18.06.8-ramips-mt7621.Linux-x86_64.tar.xz &&\
    tar -xf openwrt-imagebuilder-18.06.8-ramips-mt7621.Linux-x86_64.tar &&\
    mv openwrt-imagebuilder-18.06.8-ramips-mt7621.Linux-x86_64 img18.06 &&\
    rm -rf openwrt-imagebuilder-18.06.8-ramips-mt7621.Linux-x86_64.tar

WORKDIR /home/openwrt/img18.06

RUN sed -i 's_downloads.openwrt.org_mirrors.tuna.tsinghua.edu.cn/openwrt_' repositories.conf &&\
    mkdir -p files &&\
    make image PROFILE=d-team_newifi-d2 \
        PACKAGES="-dnsmasq dnsmasq-full -wpad-mini wpad luci luci-i18n-base-zh-cn luci-i18n-firewall-zh-cn zerotier ttyd" \
        FILES=files/

WORKDIR /home/openwrt

RUN wget https://mirrors.tuna.tsinghua.edu.cn/openwrt/releases/18.06.8/targets/ramips/mt7621/openwrt-sdk-18.06.8-ramips-mt7621_gcc-7.3.0_musl.Linux-x86_64.tar.xz &&\
    xz -d openwrt-sdk-18.06.8-ramips-mt7621_gcc-7.3.0_musl.Linux-x86_64.tar.xz &&\
    tar -xf openwrt-sdk-18.06.8-ramips-mt7621_gcc-7.3.0_musl.Linux-x86_64.tar &&\
    mv openwrt-sdk-18.06.8-ramips-mt7621_gcc-7.3.0_musl.Linux-x86_64 sdk18.06 &&\
    rm -rf openwrt-sdk-18.06.8-ramips-mt7621_gcc-7.3.0_musl.Linux-x86_64.tar

WORKDIR /home/openwrt/sdk18.06

RUN ./scripts/feeds update -a
