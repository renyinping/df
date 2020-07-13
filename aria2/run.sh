docker run -d \
    --name aria2-pro \
    --restart unless-stopped \
    --log-opt max-size=1m \
    --network host \
    -e PUID=1000 \
    -e PGID=100 \
    -e RPC_SECRET=aria2null \
    -e RPC_PORT=6800 \
    -e LISTEN_PORT=6888 \
    -v /srv/dev-disk-by-label-SHARE/share/aria2/aria2-config:/config \
    -v /srv/dev-disk-by-label-SHARE/share/aria2/aria2-downloads:/downloads \
    p3terx/aria2-pro