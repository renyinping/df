docker pull nextcloud:18

dir=/srv/dev-disk-by-label-SHARE/nextcloud

docker run \
    --name nextcloud \
    --link pgdb:db \
    -p 88:80 \
    -v $dir:/var/www/html \
    -d nextcloud:18
