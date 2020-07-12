# docker pull alqutami/rtmp-hls

docker run \
    --name rtmp \
    -p 1935:1935 \
    -p 8080:8080 \
    -v /srv/dev-disk-by-label-SHARE/rtmp/custom.conf:/etc/nginx/nginx.conf \
    -d yinping/rtmp

#   -v /srv/dev-disk-by-label-SHARE/rtmp/custom_players:/usr/local/nginx/html/players \
#   -v /srv/dev-disk-by-label-SHARE/rtmp/mnt:/mnt \
#   -v /srv/dev-disk-by-label-SHARE/rtmp/html:/usr/local/nginx/html \
