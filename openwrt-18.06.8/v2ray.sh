url=https://github.com/v2ray/v2ray-core/releases/download/v4.26.0/v2ray-linux-arm64.zip
file=v2ray-linux-arm64.zip
dockername=openwrt

if [ ! -e $file ]
then
    wget -O $file $url
fi

unzip -d v2ray $file
cp v2ray.openwrt v2ray/
cp v2ray.install v2ray/
cp config.json v2ray/
docker cp v2ray $dockername:/etc/
rm -rf v2ray/