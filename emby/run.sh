docker pull emby/embyserver_arm64v8
# docker run --name emby -p 8096:8096 -p 8920:8920 -e UID=1000 -e GID=100 -d emby/embyserver_arm64v8

emby=/srv/dev-disk-by-label-SHARE/emby
share1=/srv/dev-disk-by-label-SHARE/share/dl
share2=/srv/dev-disk-by-label-SHARE/share/old/me

docker run \
    --name emby \
    --volume $emby/programdata:/config \
    --volume $share1:/mnt/share1 \
    --volume $share2:/mnt/share2 \
    --publish 8096:8096 \
    --publish 8920:8920 \
    --env UID=1000 \
    --env GID=100 \
    -d emby/embyserver_arm64v8

#   --env GIDLIST=100 \
#   --device /dev/dri:/dev/dri \
#   --runtime=nvidia \
