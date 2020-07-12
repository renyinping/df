docker pull gists/qbittorrent

docker run \
  --name qbittorrent \
  --network host \
  -e UID=1000 \
  -e GID=1000 \
  -e TZ=Asia/Chongqing \
  -e UMASK_SET=022 \
  -e WEB_PORT=81 \
  -v /srv/dev-disk-by-label-SHARE/share/dl/qbittorrent:/data \
  -d gists/qbittorrent

  # -p 81:81 \
  # -p 6881:6881 \
  # -p 6881:6881/udp \

  # webui为ip:81，默认用户名/密码为admin/adminadmin

  # https://github.com/ngosang/trackerslist/blob/master/trackers_best_ip.txt
