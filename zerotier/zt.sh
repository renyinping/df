#!/bin/sh

# 检测内核是否支持tun: modinfo tun
# 开启tun: lsmod | grep tun
# 检测开启情况： lsmod | grep tun

docker run \
  --restart unless-stopped \
  --name zt0 \
  --device /dev/net/tun \
  --net host \
  --cap-add NET_ADMIN \
  --cap-add SYS_ADMIN \
  -v /data/zerotier-one:/var/lib/zerotier-one \
  -d henrist/zerotier-one


docker run \
  --restart unless-stopped \
  --name zt \
  --device /dev/net/tun \
  --net host \
  --cap-add NET_ADMIN \
  --cap-add SYS_ADMIN \
  -v /data/zerotier-one:/var/lib/zerotier-one \
  -d yinping/zerotier:1.4.6

# 加入网络
docker exec zt zerotier-cli join NETWORK-ID

docker exec zt zerotier-cli status