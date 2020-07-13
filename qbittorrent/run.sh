docker pull gists/qbittorrent

docker run \
    --name=qbittorrent \
    --network=host \
    -e WEB_PORT=81 \
    -e PEER_PORT=6881 \
    -v /srv/dev-disk-by-label-SHARE/share/qbittorrent/data:/data \
    -d gists/qbittorrent

  # -e UID=1000 \
  # -e GID=100 \
  # -e TZ=Asia/Chongqing \
  # -e UMASK_SET=022 \
  # -p 81:81 \
  # -p 6881:6881 \
  # -p 6881:6881/udp \
  #
  #  -v /srv/dev-disk-by-label-SHARE/share/qbittorrent/config:/config \

  # webui为ip:81，默认用户名/密码为admin/adminadmin

  # https://github.com/ngosang/trackerslist/blob/master/trackers_best_ip.txt

# sed -i 's/dl-cdn.alpinelinux.org/mirrors.tuna.tsinghua.edu.cn/g' /etc/apk/repositories
# apk add --no-cache python3 zlib openssl boost curl
