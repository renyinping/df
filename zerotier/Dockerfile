FROM yinping/mt7621

USER openwrt

WORKDIR /home/openwrt

RUN git clone https://github.com/mwarning/zerotier-openwrt.git &&\
    ln -s /home/openwrt/zerotier-openwrt/zerotier /home/openwrt/sdk18.06/package/zerotier

WORKDIR /home/openwrt/sdk18.06

RUN wget -O .config https://github.com/renyinping/df/raw/master/mt7621/config.18.06-mt7621 &&\
    make package/zerotier/download &&\
    make package/zerotier/download &&\
    make package/zerotier/prepare &&\
    make package/zerotier/compile &&\
    make package/index
