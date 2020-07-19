docker run \
    --name zerotier-one \
    --device /dev/net/tun \
    --cap-add NET_ADMIN \
    --cap-add SYS_ADMIN \
    -p 19993:9993/udp \
    -p 53543:53543 \
    -p 53543:53543/udp \
    -v /srv/dev-disk-by-label-SHARE/zerotier-one:/var/lib/zerotier-one \
    -d yinping/zerotier-one

# docker exec zerotier-one zerotier-cli join 159924d6306eb693

# docker exec -ti zerotier-one /bin/bash 
# cd /var/lib/zerotier-one
# zerotier-idtool initmoon identity.public > moon.json
# 修改moon.json公网地址和端口 "stableEndpoints": [ "23.23.23.23/9993" ]
# zerotier-idtool genmoon moon.json 
# mkdir -p /var/lib/zerotier-one/moons.d && mv *.moon /var/lib/zerotier-one/moons.d/

# 重启容器

# 使用 zerotier-cli orbit d4562f1795 d4562f1795
# 验证 zerotier-cli listpeers 
#      200 listpeers 18fasd2319 23.23.23.23/9994;4242;4038 224 1.2.12 MOON