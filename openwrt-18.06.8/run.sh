name=openwrt

docker run \
  --network macvlan \
  --name $name \
  -u root \
  --privileged \
  -d yinping/openwrt:18.06.8-arm64

sleep 10
docker exec $name uci set network.lan.ipaddr='192.168.11.3' &&\
docker exec $name uci set network.lan.gateway='192.168.11.1' &&\
docker exec $name uci set network.lan.dns='223.5.5.5' &&\
docker exec $name uci commit &&\
docker exec $name /etc/init.d/network restart &&\
docker exec $name sed -i 's_downloads.openwrt.org_mirrors.tuna.tsinghua.edu.cn/openwrt_' /etc/opkg/distfeeds.conf &&\
docker exec $name opkg update &&\
docker exec $name opkg install luci-i18n-base-zh-cn luci-i18n-firewall-zh-cn