docker pull emby/embyserver_arm64v8
# docker run --name emby -p 8096:8096 -p 8920:8920 -e UID=1000 -e GID=100 -d emby/embyserver_arm64v8

emby=/srv/dev-disk-by-label-SHARE/emby
share1=/srv/dev-disk-by-label-SHARE/share

docker run \
    --name emby \
    --network host \
    --volume $emby/programdata:/config \
    --volume $share1:/mnt/share1 \
    --device /dev/dri:/dev/dri \
    --env GIDLIST=44,108 \
    --env UID=1000 \
    --env GID=100 \
    -d emby/embyserver_arm64v8

#   --publish 8096:8096 \
#   --publish 8920:8920 \
#   --volume $share2:/mnt/share2 \
#   --runtime=nvidia \

# 您可以使用以下命令获取视频和/或渲染GID，并相应地设置GIDLIST变量：
# getent group video | cut -d: -f3
# getent group render | cut -d: -f3
